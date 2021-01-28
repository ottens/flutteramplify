# Setup

Install Flutter

https://flutter.dev/docs/get-started/install

Install Amplify CLI

```zsh
npm install -g @aws-amplify/cli
```

Install dependencies

```zsh
flutter pub get
```

Initialize Amplify

```zsh
% amplify init
Note: It is recommended to run this command from the root of your app directory
? Enter a name for the environment dev
? Choose your default editor: [choose]
Using default provider  awscloudformation
? Do you want to use an AWS profile? Yes
? Please choose the profile you want to use [default or other if you have multiple]
Adding backend environment dev to AWS Amplify Console app: [app ID]
⠇ Initializing project in the cloud...
[omitting logs]
✔ Successfully created initial AWS cloud resources for deployments.
✔ Initialized provider successfully.
Initialized your environment successfully.
Your project has been successfully initialized and connected to the cloud!
```

```zsh
% amplify push
✔ Successfully pulled backend environment dev from the cloud.

Current Environment: dev

| Category | Resource name          | Operation | Provider plugin   |
| -------- | ---------------------- | --------- | ----------------- |
| Auth     | flutteramplify846efcd9 | Create    | awscloudformation |
| Api      | flutteramplify         | Create    | awscloudformation |
? Are you sure you want to continue? Yes

GraphQL schema compiled successfully.

Edit your schema at [path]/schema.graphql or place .graphql files in a directory at [path]
⠴ Updating resources in the cloud. This may take a few minutes...

✔ All resources are updated in the cloud

GraphQL endpoint: [url]
```

Then run the project.

*note: the flutter app does not yet allow new users to sign up, use either the admin ui, or download the ionic or react native apps and connect them to the same backend to be able to sign up new users.*




# Frameworks

## Flutter Resources

Flutter is Google’s UI toolkit for building natively compiled applications for mobile, web and desktop from a single codebase. It uses the Dart language. “Dart is an object-oriented, class-based, garbage-collected language with C-style syntax. Dart can compile to either native code or JavaScript.” Development can be done using Android Studio 4.1 or other IDEs.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Amplify + Flutter Resources

“AWS Amplify is a set of tools and services that can be used together or on their own, to help front-end web and mobile developers build scalable full stack applications, powered by AWS. With Amplify, you can configure app back ends and connect your app in minutes, deploy static web apps in a few CLIcks, and easily manage app content outside the AWS console.” AWS Amplify has a CLI for setting up the different supported AWS services, like APIs, Authentication, Storage, Functions, et cetera. It also provides libraries for seamless integration with Ionic, React Native and Flutter, as well as direct iOS and Android development.

### Generic Tutorials

https://flutter.dev/docs/get-started/install - both setup and creating your first app
https://docs.amplify.aws/start/q/integration/flutter - Flutter and Amplify

### Useful links

https://flutter.dev/ - Flutter home page
https://dart.dev - more about the dart language
