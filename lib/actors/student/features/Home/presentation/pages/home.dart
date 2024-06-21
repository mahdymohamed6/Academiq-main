import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:necessities/actors/parent/data/Models/timetable/student_timetable/timetable.dart';
import 'package:necessities/actors/parent/features/parentHome/data/data_source/remote_Data_source.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/Drawerr.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/childAvtivitesCard.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/imageListViewBuilder.dart';
import 'package:necessities/actors/parent/widgets/appBar.dart';
import 'package:necessities/actors/student/data/model/userModel/user_model_time_table/user_model_time_table.dart';
import 'package:necessities/actors/student/features/Home/data/data_source/gat_user_service.dart';
import 'package:necessities/actors/student/features/Home/data/data_source/get_student_courses.dart';
import 'package:necessities/actors/student/features/Home/domain/entitiy/child_entity.dart';
import 'package:necessities/actors/student/features/Home/domain/entitiy/cours_entity.dart';
import 'package:necessities/actors/student/features/Notification/presentation/pages/NotificationPage.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';
import 'package:necessities/actors/student/features/Home/presentation/widgets/class_schedule.dart';
import 'package:necessities/actors/student/features/Home/presentation/widgets/holidays.dart';
import 'package:necessities/actors/student/features/Home/presentation/widgets/student_details.dart';
import 'package:necessities/login/data/models/user_model/user_model.dart';
import 'package:necessities/widgets/custom_appbar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../../../login/data/models/user/user_details/user_details.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
/*   List<CourseEntity> _coursesList = [];
 */
  List<Timetable>? timetable;
  String? gradeClassId;

  @override
  void initState() {
    super.initState();
    _loadTimeTable();
/*     getStudentCourse();
 */
    print('time table : ${timetable}');
    print('gradeid : ${gradeClassId}');
    getUserInfo();
  }

  Future<UserModelTimeTable> getUser({required String id}) async {
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
      return UserModelTimeTable.fromJson(childs);
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<void> _loadTimeTable() async {
    try {
      final id = GetStorage().read('id');
      UserModelTimeTable user = await getUser(id: id);
      if (user.user != null && user.user!.gradeClass != null) {
        // Assuming gradeClassId is a single value, not a list
        gradeClassId = user.user!.gradeClass!.id;
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

  String id = GetStorage().read('id');

  ChildEntity childEntity = ChildEntity(
      id: '',
      fristName: '',
      secondtName: '',
      motherId: '',
      fatherId: '',
      userName: '',
      userId: '');
/* 
  Future<void> getStudentCourse() async {
    final coursesList = await getStudentCourses();
    setState(() {
      _coursesList = coursesList;
    });
  } */

  Future<void> getUserInfo() async {
    childEntity = await fetchUserData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: const Drawer(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        child: Drawerr(),
      ),
      backgroundColor: Colors.white,
      appBar: buildParentAppBar(context) as PreferredSize,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GestureDetector(
                  onTap: () {
                    // AssignmentService().getAssignments();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25))),
                    height: height * 0.06,
                    width: width,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                        Text('Search here',
                            style: Style().title.copyWith(
                                color: Colors.grey.withOpacity(0.5),
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            StudentDetails(
              childEntity: childEntity,
            ),
            const SizedBox(
              height: 10,
            ),
            ImageListViewBuilder(),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            timetable != null
                ? Expanded(
                    child: ListView.builder(
                      itemCount: 1,
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
                    child: CircularProgressIndicator(color: primaryColor1),
                  ),
          ],
        ),
      ),
    );
  }
} /*  */
