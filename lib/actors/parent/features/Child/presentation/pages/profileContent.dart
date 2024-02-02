import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/Child/presentation/widgets/childDetails.dart';
import 'package:necessities/actors/parent/features/Child/presentation/widgets/familyDetails.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height,
          width: width,
          child: Column(
            children: [
              childDetails(width: width, height: height),
              SizedBox(
                width: 10,
              ),
              FamilyDetails()
            ],
          ),
        ),
      );
  }
}