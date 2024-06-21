import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
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
import 'package:necessities/actors/student/features/Home/data/models/child/UserChildModel.dart';
import 'package:necessities/actors/student/features/Home/domain/entitiy/child_entity.dart';
import 'package:necessities/actors/student/features/Home/domain/entitiy/cours_entity.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/login/data/models/user/user_details/user_details.dart';

import '../../../../data/Models/timetable/student_timetable/timetable.dart';

class ParentHomeView extends StatefulWidget {
  const ParentHomeView({super.key});

  @override
  State<ParentHomeView> createState() => _ParentHomeViewState();
}

class _ParentHomeViewState extends State<ParentHomeView> {
  List<Timetable>? timetable;
  String? gradeClassId;

  @override
  void initState() {
    super.initState();
    _loadTimeTable();
  }

  Future<UserDetails> getUser({required String id}) async {
    final url = Uri.parse(baseUrl + 'users/${id}');
    final token = GetStorage().read('token');

    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> childs = jsonDecode(response.body);

      print('user is' + '${childs}');
      return UserDetails.fromJson(childs);
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<void> _loadTimeTable() async {
    final id = GetStorage().read('id');

    try {
      UserDetails user = await getUser(id: id);
      if (user.user!.children != null && user.user!.children!.isNotEmpty) {
        for (var child in user.user!.children!) {
          if (child.gradeClassId != null) {
            gradeClassId = child.gradeClassId;
            break;
          }
        }
      }

      if (gradeClassId != null) {
        final data = await TimetableService().getTimetable(id: gradeClassId!);
        setState(() {
          timetable = data.timetable!;
          timetable!.sort((a, b) => a.period!.compareTo(b.period!));
        });
        print('data is ${data} ');
      } else {
        print('No gradeClassId found in children');
      }
    } catch (error) {
      print('Error loading timetable: $error');
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
          GestureDetector(
            onTap: () {
              print(gradeClassId);
            },
            child: const CustomizedSearchBar(
              text: 'Search here',
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          ImageListViewBuilder(),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 30),
            child: Row(
              children: [
                Text(
                  'P',
                  style: textStyle,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Timetable',
                  style: textStyle,
                ),
              ],
            ),
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
