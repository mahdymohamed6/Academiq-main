import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/Child/presentation/pages/Assignment.dart';
import 'package:necessities/actors/parent/features/Child/presentation/pages/Examination.dart';
import 'package:necessities/actors/parent/features/Child/presentation/pages/classesContent.dart';
import 'package:necessities/actors/parent/features/Child/presentation/pages/profileContent.dart';

import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';
import 'package:necessities/widgets/custom_appbar.dart';

class ChildInfoScreen extends StatefulWidget {
  const ChildInfoScreen({super.key, this.child});
  final child;
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
        body: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color(0XFFFFD4B8),
      ),
      width: width,
      child: Column(
        children: [
          const SizedBox(height: 15), // Adjust the height as needed
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  child: Image(image: AssetImage('assets/images/teacher.png')),
                ),
                Text(
                  '${widget.child.name.first} ${widget.child.name.last}',
                  style: Style().title.copyWith(color: primaryColor3),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBar(
              labelStyle: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w300,
                fontFamily: 'Poppins',
              ),
              labelColor: Colors.white,
              splashBorderRadius: BorderRadius.circular(10),
              unselectedLabelColor: Colors.grey.shade500,
              controller: tabController,
              tabs: const [
                Tab(text: 'Profile'),
                Tab(text: 'Classes'),
                Tab(text: 'Assignments'),
                Tab(text: 'ExaminationsF'),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.only(
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
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                ProfileContent(child: widget.child),
                ClassesContent(child: widget.child),
                Assignment(),
                Examination(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
