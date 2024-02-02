import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/actors/student/features/Assignment/presentation/pages/AssingmentView.dart';
import 'package:necessities/actors/student/features/Classes/presentation/pages/classes.dart';
import 'package:necessities/actors/student/features/Home/presentation/pages/home.dart';
import 'package:necessities/actors/student/features/Notification/presentation/pages/NotificationPage.dart';
import 'package:necessities/actors/student/features/TodoList/Presentation/pages/TodoScreen.dart';
import 'package:necessities/widgets/custom_appbar.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({super.key});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  int selectedIndex = 0;
  static List<Widget> screens = [
    const HomeScreen(),
    const TodoScreen(),
    const Classes(),
    const AssignmentView()
  ];
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
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
                    'assets/images/Home.png',
                    color: primaryColor1,
                  )
                : Image.asset(
                    'assets/images/Home.png',
                  ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 1
                ? Image.asset(
                    'assets/images/ToDo.png',
                    color: primaryColor1,
                  )
                : Image.asset(
                    'assets/images/ToDo.png',
                  ),
            label: 'Todo',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 2
                ? Image.asset(
                    'assets/images/Class.png',
                    color: primaryColor1,
                  )
                : Image.asset('assets/images/Class.png'),
            label: 'Classes',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 3
                ? Image.asset(
                    'assets/images/Assignment2.png',
                  )
                : Image.asset('assets/images/Assignment.png'),
            label: 'Assignment',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: primaryColor1,
        onTap: onItemTapped,
      ),
    );
  }
}
