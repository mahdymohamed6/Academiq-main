import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/Child/presentation/widgets/progressBar.dart';
import 'package:necessities/core/styles.dart';

class Assignment extends StatefulWidget {
  const Assignment({super.key});

  @override
  State<Assignment> createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  bool isPressed = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: height * 0.1,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isPressed = !isPressed;
                          });
                        },
                        icon: Icon(
                          Icons.check_circle_outline,
                          size: 34,
                          color:
                              isPressed ? Colors.green : Colors.grey.shade300,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Arabic',
                            style: Style().title.copyWith(fontSize: 16),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          const ProgressBar(
                            progress: 50,
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '12-5-2023',
                            style: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Show More ',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                size: 10,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
              ],
            ),
          );
        });
  }
}
