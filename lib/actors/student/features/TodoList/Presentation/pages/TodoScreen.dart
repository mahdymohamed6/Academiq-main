import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';
import 'package:necessities/actors/student/features/Classes/presentation/pages/classes.dart';
import 'package:necessities/actors/student/features/TodoList/Presentation/widgets/add_ToDo.dart';
import 'package:necessities/actors/student/features/TodoList/Presentation/widgets/done_assignment.dart';
import 'package:necessities/actors/student/features/TodoList/Presentation/widgets/missing_assignment.dart';
import 'package:necessities/actors/student/features/TodoList/Presentation/widgets/progress_bar.dart';
import 'package:necessities/actors/student/features/TodoList/Presentation/widgets/required_assignment.dart';
import 'package:necessities/widgets/custom_appbar.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> with TickerProviderStateMixin {
  int selectedDateIndex = 0;
  List dayList = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
  ];
  List dateList = [
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
  ];

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
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
                    scrollControlDisabledMaxHeightRatio :0.8,
                    showDragHandle:true,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      context: context,
                      builder: (context) {
                        return Todo();
                      });
                  /*   Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return Todo();
                  })); */
                },
                icon: Icon(Icons.add_box),
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
                      duration: Duration(milliseconds: 300),
                      width: selectedDateIndex == index
                          ? width * 0.24
                          : width * 0.18,
                      decoration: BoxDecoration(
                        color: selectedDateIndex == index
                            ? primaryColor1
                            : Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dayList[index],
                            style: Style().title.copyWith(
                                  color: selectedDateIndex == index
                                      ? Colors.white
                                      : Colors.grey,
                                  fontSize: 16.0,
                                ),
                          ),
                          Text(
                            dateList[index],
                            style: Style().title.copyWith(
                                  color: selectedDateIndex == index
                                      ? Colors.white
                                      : Colors.grey,
                                  fontSize: 16.0,
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
              tabs: [
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Text(
                        'Your Progress !',
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    const ProgressBar(
                      progress: 50,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: RequiredAssignment(),
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
