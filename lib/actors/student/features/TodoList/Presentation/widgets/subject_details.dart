import 'package:flutter/material.dart';

class SubjectDetails extends StatelessWidget {
  const SubjectDetails({
    super.key,
    required this.assignment,
    required this.subjectName,
  });
  final String assignment;
  final String subjectName;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subjectName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
        ),
        Text(
          assignment,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
        )
      ],
    );
  }
}
