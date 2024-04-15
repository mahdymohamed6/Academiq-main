import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';

class ClassDetails extends StatelessWidget {
  const ClassDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.2),
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Arabic',
              style: TextStyle(
                color: primaryColor1,
                fontWeight: FontWeight.w600,
                fontSize: 20,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'M.Nada Ahmed',
              style: TextStyle(
                color: secondaryColor1,
                fontSize: 12,
                fontFamily: 'Poppins',
              ),
            )
          ],
        ),
      ),
    );
  }
}
