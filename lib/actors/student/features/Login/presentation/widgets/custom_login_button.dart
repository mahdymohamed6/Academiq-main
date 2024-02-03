import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/ParentControlPage/parentControlPage.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';

class CustomizedButton extends StatelessWidget {
  const CustomizedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const ParentControlPage();
          }));
        },
        child: Container(
          width: double.infinity,
          height: height * 0.06,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: primaryColor1),
          child: Center(
            child: Text('Log in',
                style: Style().title.copyWith(color: Colors.white)),
          ),
        ));
  }
}
