import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:necessities/actors/student/features/TodoList/data/datasources/remote_data_source.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<addToDoList>(_addToDo);
    on<updateToDoList>(_updateToDo);
  }
  void _addToDo(addToDoList event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      final response = await TodoListService().addTodoList(
          title: event.title,
          description: event.description,
          schedule: event.schedule);
      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print('todo is added successfuly');
        print(responseData);
        emit(TodoSuccess());
      } else {
        print(response.body);
        print(response.request);
        print(response.statusCode);
        emit(TodoFailure());
      }
    } catch (e) {
      emit(TodoFailure());
    }
  }

  void _updateToDo(updateToDoList event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      final response = await TodoListService().updateTodo(
          id: event.id,
          title: event.title,
          description: event.description,
          completed: event.completed,
          schedule: event.schedule);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print('todo is added successfuly');
        print(responseData);
        emit(TodoSuccess());
      } else {
        print(response.body);
        print(response.request);
        print(response.statusCode);
        emit(TodoFailure());
      }
    } catch (e) {
      emit(TodoFailure());
    }
  }
}
