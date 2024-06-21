import 'dart:async';

import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/data/Models/timetable/student_timetable/student_timetable.dart';
import 'package:necessities/actors/parent/features/parentHome/data/data_source/remote_Data_source.dart';
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

import '../../../../data/Models/timetable/student_timetable/timetable.dart';

class ParentHomeView extends StatefulWidget {
  const ParentHomeView({super.key});

  @override
  State<ParentHomeView> createState() => _ParentHomeViewState();
}

class _ParentHomeViewState extends State<ParentHomeView> {
  List<String> list = ['BIO', 'Arabic'];
  List<Timetable>? timetable;
  @override
  void initState() {
    super.initState();
    _loadTimeTable();
  }

  Future<void> _loadTimeTable() async {
    try {
      final data =
          await TimetableService().getTimetable(id: '66283d3721ad54ce0d9246d3');
      setState(() {
        timetable = data.timetable!;
        timetable!.sort((a, b) => a.period!.compareTo(b.period!));
      });
    } catch (error) {
      print('Error loading attendance: $error');
    }
  }

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
          ImageListViewBuilder(),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 37),
                child: Text(
                  'Timetable',
                  style: textStyle,
                ),
              ),
            ],
          ),
          timetable != null
              ? Expanded(
                  child: ListView.builder(
                    itemCount: timetable!.length,
                    itemBuilder: (context, index) {
                      final timetableItem = timetable![index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: ChildAvtivitesCard(timetable: timetableItem),
                      );
                    },
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
          /*  Expanded(
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
          ) */
        ]),
      ),
    );
  }
}
