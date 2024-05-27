import 'package:flutter/material.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/pages/classView.dart';
import 'package:necessities/constants.dart';

class ClassDetails extends StatelessWidget {
  const ClassDetails({
    super.key,
    required this.courseName,
  });
  final String courseName;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.2),
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ClassView()));
            },
            child: Text(
              courseName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: primaryColor1,
                fontWeight: FontWeight.w600,
                fontSize: 15,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
