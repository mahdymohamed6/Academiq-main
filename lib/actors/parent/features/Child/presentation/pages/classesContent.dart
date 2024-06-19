import 'package:flutter/material.dart';
import 'package:necessities/actors/student/features/Classes/data/datasources/remote_data_source.dart';
import 'package:necessities/actors/teacher/data/data_source/data_source.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';

class ClassesContent extends StatelessWidget {
  const ClassesContent({super.key, this.child});
  final child;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return FutureBuilder(
      future: DiscussionService()
          .getCoursesByGradeClass(gradeClassId: child.gradeClassId),
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
        final courses = snapshot.data!.courses!;
        return GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 3 / 2),
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final course = courses[index];
              return Container(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: width * 0.3,
                        child: Stack(children: [
                          Positioned(
                            top: 40,
                            left: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  '${course.title}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: Style().title.copyWith(
                                        color: primaryColor3,
                                        fontSize: 12,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 5,
                            left: width * 0.3 / 2 - 25,
                            child: const CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage('assets/images/teacher.png'),
                            ),
                          )
                        ]),
                      ),
                    )
                  ],
                ),
              );
              /*  */
            });
      },
    );
  }
}
