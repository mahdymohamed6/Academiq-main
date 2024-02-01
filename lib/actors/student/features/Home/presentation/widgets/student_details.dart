import 'package:flutter/material.dart';
import 'package:necessities/core/styles.dart';

class StudentDetails extends StatelessWidget {
  const StudentDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 15,
          backgroundImage: AssetImage('assets/images/woman.png'),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Ahmed Mahmoud,',
              style:
                  Style().title.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Grad 2',
              style: Style().title.copyWith(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
