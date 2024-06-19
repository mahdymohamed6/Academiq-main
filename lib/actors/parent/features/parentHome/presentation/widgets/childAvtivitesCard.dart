import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/data/Models/timetable/student_timetable/timetable.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/avtarStack.dart';

class ChildAvtivitesCard extends StatelessWidget {
  const ChildAvtivitesCard({
    super.key,
    required this.timetable,
  });
  final timetable;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 17),
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200), color: Colors.green),
          ),
        ),
        Expanded(
          child: Container(
            width: 252,
            height: 58,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromRGBO(246, 246, 246, 1)),
            child: Row(
              children: [
                Text(
                  '${timetable.period}',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(42, 43, 44, 1)),
                ),
                const AvtarStack(),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          '${timetable.course.title}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(0, 0, 0, 1)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1),
                        child: Text(
                          '${timetable.teacher.name.first}',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(42, 43, 44, 1)),
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8, right: 8),
                      child: Text(
                        '${timetable.startTime.hour}: ${timetable.startTime.minute}',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 20),
                      child: Text(
                        '${timetable.gradeClass.room}',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            color: Color.fromRGBO(42, 43, 44, 1)),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
