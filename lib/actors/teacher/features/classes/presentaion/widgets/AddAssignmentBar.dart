import 'package:flutter/material.dart';

class AddAssignmentBar extends StatelessWidget {
  const AddAssignmentBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(
                255, 229, 227, 227), // Set the desired color here
            width: 2, // Set the desired border width
          ),
          borderRadius: BorderRadius.circular(11)),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 20),
          child: Image.asset('assets/images/Plus.png'),
        ),
        const Text(
          'add Assignment',
          style: TextStyle(
              color: Color.fromARGB(255, 89, 89, 89),
              fontSize: 14,
              fontFamily: 'poppins',
              fontWeight: FontWeight.w400),
        )
      ]),
    );
  }
}
