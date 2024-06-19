import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/Drawerr.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/widgets/TeacherAppBar.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/widgets/appbar_widget.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/widgets/dummy%20data.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';
import 'package:necessities/widgets/custom_appbar.dart';

class GradesView extends StatelessWidget {
  const GradesView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: const Drawer(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        child: Drawerr(),
      ),
      appBar: buildTeacherAppBar(context, 'Grades', true) as PreferredSize,
      body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          children: [
            Container(
              width: width * 0.8,
              height: height * 0.07,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xff000000),
                      blurRadius: 0.5,
                      spreadRadius: 0,
                      offset: Offset(0, 0))
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'Unit 1 Exam',
                      style: Style().title.copyWith(fontSize: 14),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  ),
                  const SizedBox(width: 3),
                  Container(
                    width: 4,
                    color: const Color(0xffE5E3E3),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    'Class 1',
                    style: Style().title.copyWith(fontSize: 14),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  ),
                  Container(
                    width: 4,
                    color: const Color(0xffE5E3E3),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(
                          0xff00769E,
                        ),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Grades Sheet',
                    style: Style().title.copyWith(fontSize: 18),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff00769E),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Text(
                          '90% Passed',
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffFE626B),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Text(
                          '10% Failed',
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
            ),
            Padding(
              padding: EdgeInsets.only(left: 17, right: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Name',
                    style: Style()
                        .title
                        .copyWith(color: primaryColor1, fontSize: 16),
                  ),
                  Row(
                    children: [
                      Text(
                        'Grades',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xff00769E),
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Text(
                        'Percentage',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xff00769E),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          width: 195,
                          height: 38,
                          decoration: BoxDecoration(
                            color: primaryColor1.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            names[index],
                            style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Container(
                          alignment: Alignment.center,
                          width: 40,
                          height: 38,
                          decoration: BoxDecoration(
                            color: primaryColor1.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            grades[index],
                            style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          alignment: Alignment.center,
                          width: 40,
                          height: 38,
                          decoration: BoxDecoration(
                            color: primaryColor1.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            percentage[index],
                            style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
