part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class addToDoList extends TodoEvent {
  final String title;
  final String description;
  final DateTime schedule;

  addToDoList(
      {required this.title, required this.description, required this.schedule});
}

class getToDoList extends TodoEvent {}

class updateToDoList extends TodoEvent {
  final String title;
  final String description;
  final DateTime schedule;
  final bool completed;
  final String id;
  updateToDoList({
    this.completed = false,
    required this.id,
    required this.title,
    required this.description,
    required this.schedule,
  });
}
