/*
* Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// ignore_for_file: public_member_api_docs

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the Todo type in your schema. */
@immutable
class Todo extends Model {
  static const classType = const TodoType();
  final String id;
  final String name;
  final String description;
  final bool status;
  final DateTime createdAt;
  final bool hasPhoto;
  final String fileName;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Todo._internal(
      {@required this.id,
      @required this.name,
      this.description,
      this.status,
      this.createdAt,
      this.hasPhoto,
      this.fileName});

  factory Todo(
      {@required String id,
      @required String name,
      String description,
      bool status,
      DateTime createdAt,
      bool hasPhoto,
      String fileName}) {
    return Todo._internal(
        id: id == null ? UUID.getUUID() : id,
        name: name,
        description: description,
        status: status,
        createdAt: createdAt,
        hasPhoto: hasPhoto,
        fileName: fileName);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Todo &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        status == other.status &&
        createdAt == other.createdAt &&
        hasPhoto == other.hasPhoto &&
        fileName == other.fileName;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Todo {");
    buffer.write("id=" + id + ", ");
    buffer.write("name=" + name + ", ");
    buffer.write("description=" + description + ", ");
    buffer.write(
        "status=" + (status != null ? status.toString() : "null") + ", ");
    buffer.write("createdAt=" +
        (createdAt != null ? createdAt.toDateTimeIso8601String() : "null") +
        ", ");
    buffer.write(
        "hasPhoto=" + (hasPhoto != null ? hasPhoto.toString() : "null") + ", ");
    buffer.write("fileName=" + fileName);
    buffer.write("}");

    return buffer.toString();
  }

  Todo copyWith(
      {String id,
      String name,
      String description,
      bool status,
      DateTime createdAt,
      bool hasPhoto,
      String fileName}) {
    return Todo(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        hasPhoto: hasPhoto ?? this.hasPhoto,
        fileName: fileName ?? this.fileName);
  }

  Todo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        status = json['status'],
        createdAt = DateTimeParse.fromString(json['createdAt']),
        hasPhoto = json['hasPhoto'],
        fileName = json['fileName'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'status': status,
        'createdAt': createdAt?.toDateTimeIso8601String(),
        'hasPhoto': hasPhoto,
        'fileName': fileName
      };

  static final QueryField ID = QueryField(fieldName: "todo.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField STATUS = QueryField(fieldName: "status");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField HASPHOTO = QueryField(fieldName: "hasPhoto");
  static final QueryField FILENAME = QueryField(fieldName: "fileName");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Todo";
    modelSchemaDefinition.pluralName = "Todos";

    modelSchemaDefinition.authRules = [
      AuthRule(
          authStrategy: AuthStrategy.OWNER,
          ownerField: "owner",
          identityClaim: "cognito:username",
          operations: [
            ModelOperation.CREATE,
            ModelOperation.READ,
            ModelOperation.UPDATE,
            ModelOperation.DELETE
          ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Todo.NAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Todo.DESCRIPTION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Todo.STATUS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Todo.CREATEDAT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Todo.HASPHOTO,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Todo.FILENAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class TodoType extends ModelType<Todo> {
  const TodoType();

  @override
  Todo fromJson(Map<String, dynamic> jsonData) {
    return Todo.fromJson(jsonData);
  }
}
