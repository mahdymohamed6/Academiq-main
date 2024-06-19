import 'dart:async';

import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/parentHome/data/get_child_courses.dart';
import 'package:necessities/actors/parent/features/parentHome/data/get_parent_data.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/Drawerr.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/childAvtivitesCard.dart';
import 'package:necessities/actors/parent/widgets/customizedSearchBar.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/imageListViewBuilder.dart';
import 'package:necessities/actors/parent/widgets/appBar.dart';
import 'package:necessities/actors/student/features/Home/data/data_source/gat_user_service.dart';
import 'package:necessities/actors/student/features/Home/data/data_source/get_student_courses.dart';
import 'package:necessities/actors/student/features/Home/domain/entitiy/child_entity.dart';
import 'package:necessities/actors/student/features/Home/domain/entitiy/cours_entity.dart';

class ParentHomeView extends StatefulWidget {
  const ParentHomeView({super.key});

  @override
  State<ParentHomeView> createState() => _ParentHomeViewState();
}

class _ParentHomeViewState extends State<ParentHomeView> {
  List<String> list = ['BIO', 'Arabic'];
  // List<CourseEntity> _coursesList = [];
  // ChildEntity childEntity = ChildEntity(
  //     id: '',
  //     fristName: '',
  //     secondtName: '',
  //     motherId: '',
  //     fatherId: '',
  //     userName: '',
  //     userId: '');
  // @override
  // void initState() {
  //   fetchUserData();
  //   getCourses();
  //   // TODO: implement initState
  //   super.initState();
  // }

  // Future<void> fetchUserData() async {
  //   await fetchParentData();
  // }

  // Future<void> getCourses() async {
  //   var childEntity = await fetchChildCourses();
  //   setState(() {});
  // }

  Widget build(BuildContext context) {
    var textStyle = TextStyle(
        fontSize: 18,
        color: Colors.grey.shade900,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins');
    return Scaffold(
      drawer: const Drawer(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        child: Drawerr(),
      ),
      backgroundColor: Colors.white,
      appBar: buildParentAppBar(context) as PreferredSize,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomizedSearchBar(
            text: 'Search here',
          ),
          const SizedBox(
            height: 24,
          ),
          PublicAnnouncment(),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 37),
            child: Text(
              'Today Timetable',
              style: textStyle,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 33, top: 24),
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ChildAvtivitesCard(text: list[index]),
                    );
                  }),
            ),
          )
        ]),
      ),
    );
  }
}
