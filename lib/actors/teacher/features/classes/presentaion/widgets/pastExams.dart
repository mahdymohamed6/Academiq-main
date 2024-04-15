import 'package:flutter/material.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/pages/ExamDetails.dart';
import 'package:necessities/core/styles.dart';

class PastExams extends StatelessWidget {
  const PastExams({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ExamDetails();
                }));
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Unit 1',
                            style: Style().title.copyWith(fontSize: 18),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '(1/1/2024)',
                            style: Style().title.copyWith(
                                color: Color(0xff999999), fontSize: 14),
                          ),
                        ],
                      ),
                      Text(
                        '20 questions',
                        style: Style()
                            .title
                            .copyWith(color: Color(0xff999999), fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
