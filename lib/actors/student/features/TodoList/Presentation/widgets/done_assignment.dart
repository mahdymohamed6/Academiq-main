import 'package:flutter/material.dart';
import 'package:necessities/actors/student/features/TodoList/Presentation/widgets/subject_details.dart';

class DoneAssignment extends StatelessWidget {
  const DoneAssignment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0XFFE9F8FB),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.check_circle),
                color: Colors.green),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: SubjectDetails(
                assignment: 'Assignment. no2 tutorial ',
                subjectName: 'Arabic',
              ),
            )
          ],
        ),
      ),
    );
  }
}
