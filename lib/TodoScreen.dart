import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';
import 'package:necessities/widgets/custom_appbar.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  int selectedDateIndex = 2;
  List dayList = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
  ];
  List dateList = [
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          Text(
            'Todo List',
            style: TextStyle(
                color: primaryColor1,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins'),
          ),
          [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_box),
              color: primaryColor1,
            )
          ]),
      body: Column(
        children: [
          Container(
            height: height * 0.15,
            color: Colors.amber,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dateList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDateIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 10,
                    ),
                    child: Container(
                      width: width * 0.18,
                      height: height * 0.1, // Set the fixed height to 200
                      decoration: BoxDecoration(
                          color: selectedDateIndex == index
                              ? primaryColor1
                              : Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.grey)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(dayList[index],
                              style: Style().title.copyWith(
                                    color: selectedDateIndex == index
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: 16.0,
                                  )),
                          Text(
                            dateList[index],
                           style: Style().title.copyWith(
                                    color: selectedDateIndex == index
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: 16.0,
                                  )),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(
            height: 2,
            color: Colors.grey.withOpacity(0.2),
          )
        ],
      ),
    );
  }
}
