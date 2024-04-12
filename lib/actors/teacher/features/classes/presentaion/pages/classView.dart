import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/Drawerr.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/pages/AssignmentsView.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/pages/FilesView.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/pages/StudentsView.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/pages/postsView.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/widgets/TeacherAppBar.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';

class ClassView extends StatefulWidget {
  const ClassView({super.key});

  @override
  State<ClassView> createState() => _PostsViewState();
}

class _PostsViewState extends State<ClassView> {
  @override
  Widget build(BuildContext context) {
    // TabController tabController = TabController(length: 3, vsync: this.context);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
          drawer: const Drawer(
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
            child: Drawerr(),
          ),
          backgroundColor: Colors.white,
          appBar: buildTeacherAppBar(context, 'Classes', true) as PreferredSize,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                TabBar(
                  labelStyle: Style().title.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                      ),
                  labelColor: primaryColor1,
                  indicatorColor: primaryColor1,
                  splashBorderRadius: BorderRadius.circular(10),
                  unselectedLabelColor: Colors.grey.shade500,
                  indicatorPadding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  // controller: tabController,
                  tabs: const [
                    Tab(text: 'Posts'),
                    Tab(text: 'Files'),
                    Tab(text: 'Students'),
                    Tab(text: 'Assignments'),
                  ],
                ),
                const Expanded(
                  child: TabBarView(children: [
                    PostsView(),
                    FilesView(),
                    StudentsView(),
                    AssignmentsView(),
                  ]),
                )
              ],
            ),
          )),
    );
  }
}
