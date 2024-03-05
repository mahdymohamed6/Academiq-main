import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/Child/presentation/pages/Assignment.dart';
import 'package:necessities/actors/parent/features/Child/presentation/pages/Examination.dart';
import 'package:necessities/actors/parent/features/Child/presentation/pages/classesContent.dart';
import 'package:necessities/actors/parent/features/Child/presentation/pages/profileContent.dart';

import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';
import 'package:necessities/widgets/custom_appbar.dart';

class ChildInfoScreen extends StatefulWidget {
  const ChildInfoScreen({super.key});

  @override
  State<ChildInfoScreen> createState() => _ChildInfoScreenState();
}

class _ChildInfoScreenState extends State<ChildInfoScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);


    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: customAppBar(
                Image.asset(
                  '$logo2',
                  height: height * 0.1,
                  width: width * 0.3,
                ),
                [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        color: primaryColor1,
                      ))
                ]),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    height: 60,
                    width: width,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                        Text(
                          'Search here',
                          style: Style().title.copyWith(
                                color: Colors.grey.withOpacity(0.5),
                                fontSize: 18,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(0XFFFFD4B8),
                        ),
                        width: width,
                        child: Padding(
                            padding: const EdgeInsets.only(
                                top: 55.0, ),
                            child: Column(
                              children: [
                       const         SizedBox(
                                    height:
                                        15), // Adjust the height as needed
                                Text(
                                  'Jane Cooper',
                                  style: Style()
                                      .title
                                      .copyWith(color: primaryColor3),
                                ),
                           const      SizedBox(
                                    height:
                                        15),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TabBar(
                                    labelStyle:const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Poppins',
                                    ),
                                    labelColor: Colors.white,
                                    splashBorderRadius:
                                        BorderRadius.circular(10),
                                    unselectedLabelColor:
                                        Colors.grey.shade500,
                                    controller: tabController,
                                    tabs: const[
                                      Tab(text: 'Profile'),
                                      Tab(text: 'Classes'),
                                      Tab(text: 'Assignments'),
                                      Tab(text: 'ExaminationsF'),
                                    ],
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    indicatorPadding:const EdgeInsets.only(
                                      top: 12,
                                      bottom: 12,
                                    ),
                                    indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      shape: BoxShape.rectangle,
                                      color: primaryColor3,
                                    ),
                                  ),
                                ),
                            const    SizedBox(height: 8,),
                                Expanded(
                                  child: TabBarView(
                                    controller: tabController,
                                    children:const [
                                      ProfileContent(),
                                      ClassesContent(),
                                      Assignment(),
                                      Examination(),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                const    CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          AssetImage('assets/images/teacher.png'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
