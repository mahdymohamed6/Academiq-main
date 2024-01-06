import 'package:flutter/material.dart';

class SubjectsListViewItem extends StatefulWidget {
  const SubjectsListViewItem({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SubjectsListViewItemState createState() => _SubjectsListViewItemState();
}

class _SubjectsListViewItemState extends State<SubjectsListViewItem> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 23),
                child: SubjectDetails(
                  assignment: 'Assignment. no2 tutorial ',
                  subjectName: 'Arabic',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

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
