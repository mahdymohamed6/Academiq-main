import 'package:flutter/material.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/pages/Attendance.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/pages/ExamScreen.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/pages/classView.dart';
import 'package:necessities/constants.dart';

class TeacherHomePage extends StatefulWidget {
  const TeacherHomePage({super.key});

  @override
  State<TeacherHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  int selectedIndex = 0;
  static List<Widget> screens = [
    ClassView(),
    Center(child: Text('Grades')),
    const ExamScreen(),
    const AttendanceScreen()
  ];
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
          color: primaryColor1,
          fontSize: 15,
          fontFamily: 'Poppins',
        ),
        unselectedLabelStyle: TextStyle(
          color: primaryColor1,
          fontSize: 15,
          fontFamily: 'Poppins',
        ),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: selectedIndex == 0
                ? Image.asset(
                    'assets/images/classes.png',
                    color: primaryColor1,
                  )
                : Image.asset(
                    'assets/images/classes.png',
                  ),
            label: 'Classes',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 1
                ? Image.asset(
                    'assets/images/grades.png',
                    color: primaryColor1,
                  )
                : Image.asset(
                    'assets/images/grades.png',
                  ),
            label: 'Grades',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 2
                ? Image.asset(
                    'assets/images/exams.png',
                    color: primaryColor1,
                  )
                : Image.asset('assets/images/exams.png'),
            label: 'Exams',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 3
                ? Image.asset(
                    'assets/images/attendColored.png',
                  )
                : Image.asset('assets/images/attend.png'),
            label: 'Attend',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: primaryColor1,
        onTap: onItemTapped,
      ),
    );
  }
}
