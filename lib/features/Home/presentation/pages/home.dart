import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';
import 'package:necessities/features/Classes/presentation/pages/classes.dart';
import 'package:necessities/features/Home/presentation/widgets/class_schedule.dart';
import 'package:necessities/features/Home/presentation/widgets/holidays.dart';
import 'package:necessities/features/Home/presentation/widgets/student_details.dart';
import 'package:necessities/features/TodoList/Presentation/pages/TodoScreen.dart';
import 'package:necessities/widgets/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return TodoScreen();
                      }));
                    },
                    icon: Icon(
                      Icons.notifications,
                      color: primaryColor1,
                    ))
              ]),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  height: height * 0.06,
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
                      Text('Search here',
                          style: Style().title.copyWith(
                              color: Colors.grey.withOpacity(0.5),
                              fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ),
            StudentDetails(),
            SizedBox(
              height: 10,
            ),
            Holidays(width: width, height: height),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return ClassSchedule(width: width, height: height);
                    }))
          ],
        ),
      ),
    );
  }
}





/*  */