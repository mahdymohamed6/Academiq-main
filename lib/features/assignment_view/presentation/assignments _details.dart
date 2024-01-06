import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';

class AssignmentsDetails extends StatelessWidget {
  const AssignmentsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/images/Caret_Circle_Left.png',
                    scale: 0.88,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Assignments Details',
                      style: TextStyle(
                        color: primaryColor1,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            const Divider(
              color: Color.fromARGB(89, 95, 187, 229),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Assignments Name',
                  style: TextStyle(
                    color: primaryColor1,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
                const Text(
                  '5 Point',
                  style: TextStyle(
                    color: Color(0xFF26B170),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            const Text(
              'Description',
              style: TextStyle(
                color: Color(0xFF2A2A2A),
                fontSize: 17,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'I want to easily view the titles of tasks or assignments assigned by my teachers for todays homework.',
              style: TextStyle(
                color: Color(0xFF858585),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 10),
            const Divider(
              thickness: 0.7,
              color: Color(0xFFEDEDED),
            ),
            const SizedBox(height: 12),
            const Text(
              'Deadline',
              style: TextStyle(
                color: Color(0xFF2A2A2A),
                fontSize: 17,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'I want to easily view the titles of tasks or assignments assigned by my teachers for todays homework.',
              style: TextStyle(
                color: Color(0xFF858585),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 10),
            const Divider(
              thickness: 0.7,
              color: Color(0xFFEDEDED),
            ),
            const SizedBox(height: 10),
            Text(
              'Send your answer',
              style: TextStyle(
                color: primaryColor1,
                fontSize: 24,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Attachment*',
              style: TextStyle(
                color: Color(0xFF2A2A2A),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
