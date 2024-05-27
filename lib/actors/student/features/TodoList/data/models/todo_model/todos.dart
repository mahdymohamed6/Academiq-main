import 'package:equatable/equatable.dart';

import 'assessment_todo.dart';
import 'todo.dart';

class Todos extends Equatable {
  final List<Todo>? todo;
  final List<AssessmentTodo>? assessmentTodos;

  const Todos({this.todo, this.assessmentTodos});

  factory Todos.fromJson(Map<String, dynamic> json) => Todos(
        todo: (json['todo'] as List<dynamic>?)
            ?.map((e) => Todo.fromJson(e as Map<String, dynamic>))
            .toList(),
        assessmentTodos: (json['assessmentTodos'] as List<dynamic>?)
            ?.map((e) => AssessmentTodo.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'todo': todo?.map((e) => e.toJson()).toList(),
        'assessmentTodos': assessmentTodos?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [todo, assessmentTodos];
}
