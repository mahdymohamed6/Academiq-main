import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/Drawerr.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/widgets/TeacherAppBar.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/widgets/pastExams.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: const Drawer(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        child: Drawerr(),
      ),
      appBar: buildTeacherAppBar(context, 'Exams',true) as PreferredSize,
      body: Column(
        children: [
          TabBar(
            labelStyle: Style().title.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Poppins',
                ),
            labelColor: primaryColor1,
            indicatorColor: primaryColor1,
            splashBorderRadius: BorderRadius.circular(10),
            unselectedLabelColor: Colors.grey.shade500,
            controller: tabController,
            tabs: const [
              Tab(text: 'Past'),
              Tab(text: 'Pending'),
              Tab(text: 'Upcoming'),
            ],
          ),
          SizedBox(
            height: height * 0.7,
            child: TabBarView(controller: tabController, children: [
              PastExams(),
              Text('dsaasddsa'),
              Text('dsaasddsa'),
            ]),
          )
        ],
      ),
    );
  }
}
