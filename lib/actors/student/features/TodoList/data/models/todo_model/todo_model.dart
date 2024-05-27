import 'package:equatable/equatable.dart';

import 'todos.dart';

class TodoModel extends Equatable {
  final String? message;
  final Todos? todos;

  const TodoModel({this.message, this.todos});

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        message: json['message'] as String?,
        todos: json['todos'] == null
            ? null
            : Todos.fromJson(json['todos'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'todos': todos?.toJson(),
      };

  @override
  List<Object?> get props => [message, todos];
}
