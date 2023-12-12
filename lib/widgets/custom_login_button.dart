import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';

class CustomizedButton extends StatelessWidget {
  const CustomizedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 49,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient:  LinearGradient(
            begin: Alignment.topLeft,
            end:Alignment.bottomRight ,
            colors: [primaryColor1, secondaryColor1],
          )),
      child: const Center(
        child: Text(
          'Log in',
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
