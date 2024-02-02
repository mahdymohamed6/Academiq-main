import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/Child/presentation/widgets/familyDetails.dart';
import 'package:necessities/actors/parent/features/Child/presentation/widgets/teacherDetails.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';

class childDetails extends StatelessWidget {
  const childDetails({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: width * 0.5,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      child: Text('Name: ',
                          style: Style()
                              .title
                              .copyWith(color: primaryColor3, fontSize: 18)),
                    ),
                    Container(
                      child: Expanded(
                        child: Text('Jane Cooper',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Style()
                                .title
                                .copyWith(color: Colors.grey, fontSize: 14)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: width * 0.5,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      child: Text('Grad: ',
                          style: Style()
                              .title
                              .copyWith(color: primaryColor3, fontSize: 18)),
                    ),
                    Container(
                      child: Expanded(
                        child: Text('Binaries',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Style()
                                .title
                                .copyWith(color: Colors.grey, fontSize: 14)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: width * 0.5,
              height: height * 0.12,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Text('Specialization',
                          style: Style()
                              .title
                              .copyWith(color: primaryColor3, fontSize: 18)),
                    ),
                    Container(
                      child: Text('Jane Scientific',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Style()
                              .title
                              .copyWith(color: Colors.grey, fontSize: 14)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TeacherDetails()
          ],
        ),
        SizedBox(
          width: 10,
        ),
        FamilyDetails()
      ],
    );
  }
}
