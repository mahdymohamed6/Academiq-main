import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:necessities/actors/student/features/TodoList/Presentation/widgets/subject_details.dart';
import 'package:necessities/actors/student/features/TodoList/data/datasources/remote_data_source.dart';

class RequiredAssignment extends StatefulWidget {
  const RequiredAssignment({
    Key? key,
    required this.title,
    required this.description,
    required this.id,
    required this.createdAt,
  }) : super(key: key);
  final String title;
  final String description;
  final String id;
  final DateTime? createdAt;
  @override
  // ignore: library_private_types_in_public_api
  _RequiredAssignmentState createState() => _RequiredAssignmentState();
}

class _RequiredAssignmentState extends State<RequiredAssignment> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final String token = GetStorage().read('token');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  isPressed = !isPressed;
                });
              },
              icon: Icon(
                Icons.check_circle,
                size: 34,
                color: isPressed ? Colors.green : Colors.grey.shade300,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: SubjectDetails(
                assignment: widget.description,
                subjectName: widget.title,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
