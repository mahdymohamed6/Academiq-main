import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:necessities/actors/student/features/TodoList/Presentation/blocs/bloc/todo_bloc.dart';
import 'package:necessities/actors/student/features/TodoList/Presentation/widgets/add_ToDo.dart';
import 'package:necessities/actors/student/features/TodoList/Presentation/widgets/subject_details.dart';
import 'package:necessities/actors/student/features/TodoList/data/datasources/remote_data_source.dart';
import 'package:necessities/actors/student/features/TodoList/data/models/todo_model/todo.dart';
import 'package:intl/intl.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;
  final TodoBloc todoBloc;

  const TodoItem({Key? key, required this.todo, required this.todoBloc})
      : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool? todoComp;

  @override
  void initState() {
    super.initState();
    todoComp = widget.todo.completed;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      bloc: widget.todoBloc,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () async {
                    widget.todoBloc.add(updateToDoList(
                      id: widget.todo.id!,
                      title: widget.todo.title!,
                      description: widget.todo.description!,
                      schedule: widget.todo.schedule!,
                      completed: !widget.todo.completed!,
                    ));
                    setState(() {});
                    print(todoComp);
                  },
                  icon: Icon(
                    Icons.check_circle,
                    size: 34,
                    color: todoComp! ? Colors.green : Colors.grey,
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: SubjectDetails(
                    assignment: widget.todo.description!,
                    subjectName: widget.todo.title!,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            scrollControlDisabledMaxHeightRatio: 0.8,
                            showDragHandle: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                            ),
                            context: context,
                            builder: (context) {
                              return AddToTodo(
                                id: widget.todo.id!,
                                schedule: widget.todo.schedule!,
                                description: widget.todo.description!,
                                title: widget.todo.title!,
                              );
                            });
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () async {
                        await TodoListService().deleteTodo(
                          id: widget.todo.id!,
                        );
                        // Handle state update after deletion
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
