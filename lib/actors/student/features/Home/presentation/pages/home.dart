import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/Drawerr.dart';
import 'package:necessities/actors/parent/widgets/appBar.dart';
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
import 'package:necessities/widgets/custom_appbar.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  List<CourseEntity> _coursesList = [];
  String id = GetStorage().read('id');

  ChildEntity childEntity = ChildEntity(
      id: '',
      fristName: '',
      secondtName: '',
      motherId: '',
      fatherId: '',
      userName: '',
      userId: '');
  @override
  void initState() {
    getStudentCourse();
    getUserInfo();
    super.initState();
  }

  Future<void> getStudentCourse() async {
    final coursesList = await getStudentCourses();
    setState(() {
      _coursesList = coursesList;
    });
  }

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
      body: SingleChildScrollView(
        child: Padding(
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
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
              Holidays(width: width, height: height),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _coursesList.length,
                  itemBuilder: (context, index) {
                    return ClassSchedule(
                      width: width,
                      height: height,
                      courseEntity: _coursesList[index],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
} /*  */
