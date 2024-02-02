import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';

class TeacherDetails extends StatelessWidget {
  const TeacherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
   return Container(
        width: width * 0.5,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              width: width,
              height: height * 0.12,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Text('Teachers',
                      style: Style()
                          .title
                          .copyWith(color: primaryColor3, fontSize: 18)),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: primaryColor3,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              width: width,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              child: Image(
                                  image: AssetImage('assets/images/teacher.png')),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Cooper leslie',
                              style: Style()
                                  .title
                                  .copyWith(color: Colors.grey, fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
