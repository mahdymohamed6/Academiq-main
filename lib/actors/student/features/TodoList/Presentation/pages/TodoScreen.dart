import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:necessities/actors/student/features/TodoList/Presentation/blocs/bloc/todo_bloc.dart';
import 'package:necessities/actors/student/features/TodoList/Presentation/widgets/TodoItem.dart';
import 'package:necessities/actors/student/features/TodoList/Presentation/widgets/subject_details.dart';
import 'package:necessities/actors/student/features/TodoList/data/datasources/remote_data_source.dart';
import 'package:necessities/actors/student/features/TodoList/data/models/todo_model/todo_model.dart';

import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';
import 'package:necessities/actors/student/features/TodoList/Presentation/widgets/add_ToDo.dart';
import 'package:necessities/actors/student/features/TodoList/Presentation/widgets/done_assignment.dart';
import 'package:necessities/actors/student/features/TodoList/Presentation/widgets/missing_assignment.dart';
import 'package:necessities/actors/student/features/TodoList/Presentation/widgets/progress_bar.dart';
import 'package:necessities/actors/student/features/TodoList/Presentation/widgets/required_assignment.dart';
import 'package:necessities/widgets/custom_appbar.dart';
import 'package:intl/intl.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> with TickerProviderStateMixin {
  int selectedDateIndex = 0;

  List<DateTime> dateList = [];
  String getFormattedDate(DateTime date) =>
      DateFormat('yyyy-MM-dd').format(date);

  void _generateDateList() {
    DateTime startDate = DateTime.now();
    for (int i = 0; i < 15; i++) {
      dateList.add(startDate.add(Duration(days: i)));
    }
    setState(() {});
  }

  @override
  void initState() {
    _generateDateList();

    // TODO: implement initState
    super.initState();
  }

  bool isPressed = false;
  final TodoBloc todoBloc = TodoBloc();

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    final token = GetStorage().read('token');

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: customAppBar(
            Text(
              'Todo List',
              style: TextStyle(
                color: primaryColor1,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
            [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      scrollControlDisabledMaxHeightRatio: 0.8,
                      showDragHandle: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      context: context,
                      builder: (context) {
                        return AddToTodo(
                          id: '',
                          title: '',
                          description: '',
                          schedule: DateTime.now(),
                        );
                      });
                },
                icon: const Icon(Icons.add_box),
                color: primaryColor1,
              )
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * 0.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dateList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDateIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 10,
                    ),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: selectedDateIndex == index
                          ? width * 0.24
                          : width * 0.18,
                      decoration: BoxDecoration(
                        color: selectedDateIndex == index
                            ? primaryColor1
                            : Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            getFormattedDate(dateList[index]),
                            style: Style().title.copyWith(
                                  color: selectedDateIndex == index
                                      ? Colors.white
                                      : Colors.grey,
                                  fontSize:
                                      selectedDateIndex == index ? 15 : 12,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(
            height: 2,
            color: Colors.grey.withOpacity(0.2),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 40,
            child: TabBar(
              labelStyle: Style().title.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Poppins',
                  ),
              labelColor: primaryColor1,
              indicatorColor: primaryColor1,
              splashBorderRadius: BorderRadius.circular(10),
              unselectedLabelColor: Colors.grey.shade500,
              controller: tabController,
              tabs: const [
                Tab(text: 'Assigned'),
                Tab(text: 'Missing'),
                Tab(text: 'Done'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    /* 
                    const ProgressBar(
                      progress: 50,
                    ), */
                    const SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: FutureBuilder<TodoModel>(
                        future: TodoListService().getTodo(
                          token: token,
                          date: getFormattedDate(dateList[selectedDateIndex]),
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                                child: CircularProgressIndicator(
                              color: primaryColor1,
                            ));
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData) {
                            return Text('No data');
                          }

                          final allTodos = snapshot.data!;
                          final todoList = allTodos.todos?.todo;
                          final assessmentTodosList =
                              allTodos.todos?.assessmentTodos;

                          return ListView(
                            children: [
                              if (todoList == null || todoList.isEmpty)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        'Add To Your ToDo By Clicking on the Icon ',
                                        style: Style()
                                            .title
                                            .copyWith(fontSize: 14),
                                      ),
                                    ),
                                    Icon(
                                      Icons.add_box,
                                      color: primaryColor1,
                                    )
                                  ],
                                ),
                              if (todoList != null && todoList.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Todos:',
                                        style: Style()
                                            .title
                                            .copyWith(color: primaryColor1),
                                      ),
                                      ...todoList.map((todo) {
                                        return TodoItem(
                                          todo: todo,
                                          todoBloc: todoBloc,
                                        );
                                      }).toList(),
                                    ],
                                  ),
                                ),
                              if (assessmentTodosList != null &&
                                  assessmentTodosList.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Assessment Todos:',
                                        style: Style()
                                            .title
                                            .copyWith(color: primaryColor1),
                                      ),
                                      ...assessmentTodosList
                                          .map((assessmentTodo) {
                                        return RequiredAssignment(
                                          createdAt: assessmentTodo
                                              .assessmentSchedule?.startDate,
                                          id: '',
                                          title: assessmentTodo.title!,
                                          description:
                                              assessmentTodo.description ?? '',
                                        );
                                      }).toList(),
                                    ],
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: MissingAssignment(),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: DoneAssignment(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
