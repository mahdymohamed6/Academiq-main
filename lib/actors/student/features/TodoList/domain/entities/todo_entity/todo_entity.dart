import 'package:equatable/equatable.dart';

import 'todo.dart';

class TodoEntityModel extends Equatable {
  final String? message;
  final TodoEntity? todo;

  const TodoEntityModel({this.message, this.todo});
/* 
  factory TodoEntityModel.fromJson(Map<String, dynamic> json) => TodoEntityModel(
        message: json['message'] as String?,
        todo: json['todo'] == null
            ? null
            : Todo.fromJson(json['todo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'todo': todo?.toJson(),
      }; */

  @override
  List<Object?> get props => [message, todo];
}
