import 'package:flutter/material.dart';

class StudentsView extends StatelessWidget {
  const StudentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 10),
      child: Expanded(
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return const StudentListViewItem();
          },
        ),
      ),
    );
  }
}

class StudentListViewItem extends StatelessWidget {
  const StudentListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 21,
              width: 9,
              child: Text(
                '1',
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
              'Wade Warren',
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
    );
  }
}
//