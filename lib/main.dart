import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';

import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';

import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
import './Views/SignInView.dart';

import './globals.dart' as globals;


void main() {
  globals.isLoggedIn = false;
  runApp(new MaterialApp(home: new MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;
  bool _todosLoaded = false;
  bool _loggedIn = false;
  List<Todo> _todos = new List<Todo>();
  List<String> _todoStreamingData = List();
  Stream<SubscriptionEvent<Todo>> todoStream;
  final newTodoController = TextEditingController();

  Future<Null> _showDialogForResult(
      String text, Function onSuccess, Widget dialogWidget) async {
    bool result = await showDialog(
        context: context,
        child: new SimpleDialog(title: Text(text), children: [
          dialogWidget,
          RaisedButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
        ]));

    if (result) onSuccess();
  }

  // Instantiate Amplify
  Amplify amplifyInstance = Amplify();

  @override
  void initState() {
    super.initState();
    _configureAmplify();
    _fetchTodos();
  }

  Future<void> _configureAmplify() async {
    if (!mounted) return;

    // Add Pinpoint and Cognito Plugins
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    AmplifyDataStore datastorePlugin =
    AmplifyDataStore(modelProvider: ModelProvider.instance);
    amplifyInstance.addPlugin(authPlugins: [authPlugin]);
    amplifyInstance.addPlugin(dataStorePlugins: [datastorePlugin]);

    // Once Plugins are added, configure Amplify
    await amplifyInstance.configure(amplifyconfig);
    try {
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }

    todoStream = Amplify.DataStore.observe(Todo.classType);
    todoStream.listen((event) {
      _todoStreamingData.add('Post: ' +
          (event.eventType.toString() == EventType.delete.toString()
              ? event.item.id
              : event.item.name) +
          ', of type: ' +
          event.eventType.toString());
      _fetchTodos();
    }).onError((error) => print(error));

  }

  // void _recordEvent() async {
  // }

  void _fetchTodos() async {
    try {
      _todos = await Amplify.DataStore.query(Todo.classType, sortBy: [Todo.CREATEDAT.ascending()]);
      setState(() {
        _todosLoaded = true;
      });
    } catch (e) {
      print("Query failed: ");
      print(e);
    }
  }
  void _checkTodo(Todo todo) async {
    try {
      Todo oldTodo = (await Amplify.DataStore.query(Todo.classType,
          where: Todo.ID.eq(todo.id)))[0];
      Todo newTodo = oldTodo.copyWith(id: oldTodo.id, status: todo.status == null ? true : !todo.status);

      await Amplify.DataStore.save(newTodo);
      _fetchTodos();
      // print(_todos);
    } catch (e) {
      print("Query failed: ");
      print(e);
    }
  }
  void _addTodo() async {
    try {
      Todo newTodo = new Todo();

      await Amplify.DataStore.save(newTodo.copyWith(name: newTodoController.text.trim()));
      _fetchTodos();
      // print(_todos);
    } catch (e) {
      print("Query failed: ");
      print(e);
    }
  }
  void _deleteTodo(Todo todo) async {
    try {
      Todo oldTodo = (await Amplify.DataStore.query(Todo.classType,
          where: Todo.ID.eq(todo.id)))[0];
      // Todo newTodo = oldTodo.copyWith(id: oldTodo.id, status: !todo.status);

      await Amplify.DataStore.delete(oldTodo);
      // _fetchTodos();
      // print(_todos);
    } catch (e) {
      print("Query failed: ");
      print(e);
    }
  }
  void _signOut() async {
    print('signing out');
    try {
      await Amplify.Auth.signOut();
      print('signed out');
      this._todos = new List<Todo>();
      setState(() {
        _loggedIn = false;
      });
      // globals.isLoggedIn = false;
      // print('this._loggedOut' + globals.isLoggedIn.toString());
    } on AuthError catch (e) {
      print(e);
    }
  }
  void onSignInSuccess() {
    // Navigator.pushAndRemoveUntil(context,
    //     MaterialPageRoute(builder: (context) => MainPage()), (route) => false);
    setState(() {
      _loggedIn = true;
    });
    this._fetchTodos();

    // globals.isLoggedIn = true;
    // print('this._loggedIn' + globals.isLoggedIn.toString());
  }
  void _updateTodos() async {
    this._todos = new List<Todo>();
    print('no more todos');
    this._fetchTodos();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Flutter - AWS Amplify'),
            ),
            body: ListView(padding: EdgeInsets.all(10.0), children: <Widget>[
              Center(
                child: Column (
                    children: <Widget>[
                      const Padding(padding: EdgeInsets.all(5.0)),
                      // RaisedButton(
                      //   onPressed: _updateTodos,
                      //   child: const Text('Update'),
                      // ),
                      // openDialogButton("Sign In", onSignInSuccess, SignInView()),
                      // todoWidgets(_todos),
                      renderLogin(),
                      // if (globals.isLoggedIn)
                      //   todoWidgets(_todos),
                      // RaisedButton(
                      //   onPressed: _signOut,
                      //   child: const Text('Sign Out'),
                      // ),
                    ]
                ),
              )
            ])
        )
    );
  }

  Widget renderLogin() {
    print('no more todos');

    if (_loggedIn) {
      print('render todos');

      return new Column(children: [
        Row(children: [
          Expanded(
            flex: 1,
            child: TextFormField(
              controller: newTodoController,
              decoration: const InputDecoration(
                // icon: Icon(Icons.person),
                hintText: 'Enter a new todo',
                labelText: 'Todo *',
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  icon: Icon(Icons.add_outlined),
                  color: Colors.blue,
                  tooltip: 'Delete Todo',
                  onPressed: _addTodo
              )
          ),
          ]
        ),
        todoWidgets(_todos),
        FlatButton(
          onPressed: _signOut,
          textColor: Colors.blue,
          child: const Text('Sign Out'),
        ),
      ]);
    }

    else if (!_loggedIn) {
      print('render login');

      return new Column(children: [
        openDialogButton("Sign In", onSignInSuccess, SignInView())
      ]);
    }
  }
  Widget openDialogButton(
      String text, Function onSuccess, Widget dialogWidget) {
    return RaisedButton(
        child: Text(text),
        onPressed: () {
          _showDialogForResult(text, onSuccess, dialogWidget);
        });
  }

  Widget todoWidgets(List<Todo> todos)
  {
    // return new Row(children: todos.map((todo) => new Text(todo.name)).toList());
    // print('render todoWidgets' + todos.toString());
    return new Column(children: [
      for (var todo in todos.reversed ) Row(children: [
        Checkbox(
          value: todo.status != null ? todo.status : false,
          onChanged: (value) {
            _checkTodo(todo);
          },
        ),
        Expanded(
          flex: 1,
          child: Text(todo.name),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(Icons.delete_forever_outlined),
              color: Colors.blue,
              tooltip: 'Delete Todo',
            onPressed: () {
              _deleteTodo(todo);
            }
          )
        )
      ])
    ]);
  }
}