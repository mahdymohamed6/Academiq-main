import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/actors/student/features/TodoList/Presentation/widgets/subject_details.dart';

class MissingAssignment extends StatelessWidget {
  const MissingAssignment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: missingColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.close), color: Colors.red),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: SubjectDetails(
                assignment: 'arabbb',
                subjectName: 'dassad',
              ),
            )
          ],
        ),
      ),
    );
  }
}
