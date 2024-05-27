import 'package:flutter/material.dart';
import 'package:necessities/actors/student/features/Home/domain/entitiy/cours_entity.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';

class ClassSchedule extends StatelessWidget {
  const ClassSchedule({
    super.key,
    required this.width,
    required this.height,
    required this.courseEntity,
  });
  final CourseEntity courseEntity;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${courseEntity.startDate!} pm',
            style: TextStyle(color: secondaryColor1),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              CircleAvatar(
                radius: 5,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              Container(
                height: height * 0.1,
                width: 1,
                color: Colors.green,
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            height: height * 0.1,
            width: width * 0.655,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/images/woman.png'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          courseEntity.title.toString(),
                          style: Style().title2,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mr Ahmed',
                            style: Style()
                                .title
                                .copyWith(fontSize: 16, color: Colors.grey),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Text(
                            'Lab 2',
                            style: Style()
                                .title
                                .copyWith(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
