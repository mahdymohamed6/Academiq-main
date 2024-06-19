import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/pages/TeacherControlPage/TeacherControlPage.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/pages/classView.dart';
import 'package:necessities/constants.dart';

class ClassDetails extends StatelessWidget {
  const ClassDetails({
    super.key,
    required this.courseName,
    required this.courseId,
    required this.gradeClassId,
  });
  final String courseName;
  final String courseId;
  final String gradeClassId;
  @override
  Widget build(BuildContext context) {
    var role = GetStorage().read('role');
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.2),
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => role == 'teacher'
                      ? TeacherHomePage(
                          courseId: courseId, gradeClassId: gradeClassId)
                      : ClassView(
                          courseId: courseId, gradeClassId: gradeClassId)));
            },
            child: Text(
              courseName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: primaryColor1,
                fontWeight: FontWeight.w600,
                fontSize: 15,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
