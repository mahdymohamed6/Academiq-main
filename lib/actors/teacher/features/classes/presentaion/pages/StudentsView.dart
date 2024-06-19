import 'package:flutter/material.dart';
import 'package:necessities/actors/student/features/Classes/data/datasources/remote_data_source.dart';
import 'package:necessities/actors/teacher/data/data_source/data_source.dart';
import 'package:necessities/constants.dart';

class StudentsView extends StatelessWidget {
  const StudentsView({
    super.key,
    this.gradeClassId,
  });
  final gradeClassId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DiscussionService()
            .getGradeClassStudents(gradeClassId: gradeClassId),
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
          final gradeClasses = snapshot.data;
          final gradeClassStudents = gradeClasses!.students!;
          return ListView.builder(
              itemCount: gradeClassStudents.length,
              itemBuilder: (context, index) {
                final student = gradeClassStudents![index];

                return StudentListViewItem(index: index + 1, student: student);
              });
        });
  }
}

class StudentListViewItem extends StatelessWidget {
  const StudentListViewItem({
    super.key,
    this.student,
    required this.index,
  });
  final student;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 21,
                width: 9,
                child: Text(
                  '$index',
                  style: TextStyle(
                    color: Color.fromRGBO(32, 32, 32, 1),
                    fontSize: 14,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/girlAvtar.png'),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                '${student.name.first} ${student.name.last}',
                style: TextStyle(
                  color: Color.fromRGBO(32, 32, 32, 1),
                  fontSize: 14,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}

/*  */
