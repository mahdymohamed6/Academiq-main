import 'package:flutter/material.dart';
import 'package:necessities/actors/student/features/Classes/data/datasources/remote_data_source.dart';
import 'package:necessities/actors/student/features/Classes/data/models/courses/course.dart';
import 'package:necessities/actors/student/features/Classes/data/models/courses/courses.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/actors/student/features/Classes/presentation/widgets/classDetails.dart';
import 'package:necessities/actors/student/features/Notification/presentation/pages/NotificationPage.dart';
import 'package:necessities/widgets/custom_appbar.dart';

class Classes extends StatelessWidget {
  const Classes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            customAppBar(
              Text(
                'Classes',
                style: TextStyle(
                  color: primaryColor1,
                  fontSize: 25,
                  fontFamily: 'Poppins',
                ),
              ),
              [
                IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return NotificationPage();
                    }));
                  },
                  icon: Icon(Icons.notifications),
                  color: primaryColor1,
                )
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Divider(
            color: primaryColor1,
            thickness: 0.2,
            indent: 20,
            endIndent: 20,
          ),
          FutureBuilder<Courses>(
              future: CoursesService().getCourses(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: primaryColor1,
                  ));
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return Text('No data');
                }
                final courses = snapshot.data!.courses;
                return Expanded(
                  child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(20),
                      itemCount: courses!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15),
                      itemBuilder: (context, index) {
                        final course = courses[index];
                        return ClassDetails(
                            gradeClassId: course.gradeClass!.gradeClassId!,
                            courseName: course.title!,
                            courseId: course.courseId!);
                      }),
                );
              }),
        ],
      ),
    );
  }
}
