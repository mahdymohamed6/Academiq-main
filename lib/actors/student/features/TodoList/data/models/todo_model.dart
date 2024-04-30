import 'package:equatable/equatable.dart';
import 'package:necessities/actors/student/features/TodoList/domain/entities/todo_entity/todo_entity.dart';

import 'todo.dart';

class TodoModel extends TodoEntityModel {
  final String? message;
  final Todo? todo;

  const TodoModel({this.message, this.todo});

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        message: json['message'] as String?,
        todo: json['todo'] == null
            ? null
            : Todo.fromJson(json['todo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'todo': todo?.toJson(),
      };

  @override
  List<Object?> get props => [message, todo];
}
