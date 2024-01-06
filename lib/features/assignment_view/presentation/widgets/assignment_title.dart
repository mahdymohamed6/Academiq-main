import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';

class AssignmentTitle extends StatelessWidget {
  const AssignmentTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 66,
        ),
        Center(
          child: Text(
            'Assignments',
            style: TextStyle(
              color: primaryColor1,
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        const Divider(
          color: Color.fromARGB(89, 95, 187, 229),
        ),
      ],
    );
  }
}
