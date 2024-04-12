import 'package:flutter/material.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/widgets/TeacherAppBar.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';

class ExamDetails extends StatefulWidget {
  const ExamDetails({super.key});

  @override
  State<ExamDetails> createState() => _ExamDetailsState();
}

class _ExamDetailsState extends State<ExamDetails> {
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    List answers = [
      'Speed and Efficiency',
      'User-Friendly Interface',
      'Quality and Reliability',
      'Pricing and Value for Money.',
      'Customer Support'
    ];

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: buildTeacherAppBar(context, 'Exams',true) as PreferredSizeWidget,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Unit 1 Exam',
              style: Style().title.copyWith(fontSize: 18),
            ),
            Row(
              children: [
                Text(
                  'Exams',
                  style: Style()
                      .title
                      .copyWith(color: primaryColor1, fontSize: 12),
                ),
                Text(
                  '  >  ',
                  style:
                      Style().title.copyWith(color: Colors.black, fontSize: 12),
                ),
                Text(
                  'Unit 1 Exam',
                  style:
                      Style().title.copyWith(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xffF6F6F6)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AboutExam(
                          title: 'Subject',
                          detail: 'English',
                        ),
                        AboutExam(
                          title: 'Subject',
                          detail: 'English',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AboutExam(
                          title: 'Subject',
                          detail: 'English',
                        ),
                        AboutExam(
                          title: 'Subject',
                          detail: 'English',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AboutExam(
                          title: 'Subject',
                          detail: 'English',
                        ),
                        AboutExam(
                          title: 'Subject',
                          detail: 'English',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Exam Questions',
              style: Style()
                  .title
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Mcq',
              style: Style().title.copyWith(color: Colors.grey, fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Text(
                  'Which of the following aspects of our product/service did you find most impressive?',
                  style: Style().title.copyWith(fontSize: 16),
                ),
                Column(
                  children: List.generate(
                    5,
                    (index) => ListTile(
                      title: Text(answers[index]),
                      leading: Radio(
                        value: index + 1,
                        groupValue: selectedOption,
                        activeColor: primaryColor1,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        },
                      ),
                    ),
                  ).toList(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AboutExam extends StatelessWidget {
  const AboutExam({
    super.key,
    required this.title,
    required this.detail,
  });
  final String title;
  final String detail;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title + '  ',
            style: Style().title.copyWith(color: primaryColor1, fontSize: 16),
          ),
          TextSpan(
            text: detail,
            style:
                Style().title.copyWith(color: Color(0xff595959), fontSize: 14),
          ),
        ],
      ),
    );
  }
}
