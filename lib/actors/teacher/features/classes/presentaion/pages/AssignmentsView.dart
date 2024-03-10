import 'package:flutter/material.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/widgets/AddAssignmentBar.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/widgets/AssignmentShowModelBottomSheetChild.dart';

class AssignmentsView extends StatelessWidget {
  const AssignmentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) =>
                    const AssignmentShowModalBottomSheetChild(),
              );
            },
            child: const AddAssignmentBar(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color.fromARGB(255, 229, 227, 227),
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Image.asset(
                            'assets/images/Document.png',
                          ),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Assignment no 1',
                              style: TextStyle(
                                color: Color.fromARGB(255, 32, 32, 32),
                                fontFamily: 'poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Apr 12, 2024',
                              style: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1),
                                fontFamily: 'poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          padding: EdgeInsets.zero,
                          color: const Color.fromRGBO(32, 32, 32, 1),
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    children: [
                      Text(
                        'DeadLine: ',
                        style: TextStyle(
                            color: Color.fromRGBO(32, 32, 32, 1),
                            fontSize: 14,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '24, Apr 2024  (12:00 PM)',
                        style: TextStyle(
                            color: Color.fromRGBO(89, 89, 89, 1),
                            fontSize: 14,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14, top: 14, bottom: 24),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Image.asset('assets/images/pdf.png'),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(
                          'assignment 1 requirements',
                          style: TextStyle(
                              color: Color.fromRGBO(89, 89, 89, 1),
                              fontSize: 14,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Color.fromRGBO(229, 227, 227, 1),
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: InkWell(
                    onTap: () {},
                    child: const Text(
                      'Add comment',
                      style: TextStyle(
                        color: Color.fromRGBO(153, 153, 153, 1),
                        fontSize: 12,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
  // Expanded(
  //         child: ListView.builder(
  //           itemCount: texts.length,
  //           itemBuilder: (BuildContext context, int index) {
  //             return Column(
  //               children: <Widget>[
  //                 PostWidget(
  //                   text: texts[index],
  //                 ),
  //               ],
  //             );
  //           },
  //         ),
  //       ),