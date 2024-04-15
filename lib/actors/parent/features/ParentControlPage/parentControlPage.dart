import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/parentChats/persentaiont/view/parentChatsView.dart';
import 'package:necessities/actors/parent/features/parentChild/persentation/view/parentChildView.dart';
import 'package:necessities/actors/parent/features/parentChild/persentation/widgets/childGridViewCard.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/view/parentHomeView.dart';
import 'package:necessities/actors/parent/features/parentReports/persentaion/view/parentReportsView.dart';
import 'package:necessities/constants.dart';

class ParentHomePage extends StatefulWidget {
  const ParentHomePage({super.key});

  @override
  State<ParentHomePage> createState() => _ParentHomePageState();
}

class _ParentHomePageState extends State<ParentHomePage> {
  int selectedIndex = 0;
  static List<Widget> screens = [
    const ParentHomeView(),
    const ParentChildView(),
    const ParentChatsView(),
    const ParentReportsView()
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
                    'assets/images/ChildIcon.png',
                    color: primaryColor1,
                  )
                : Image.asset(
                    'assets/images/ChildIcon.png',
                  ),
            label: 'Child',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 2
                ? Image.asset(
                    'assets/images/ChatIcon.png',
                    color: primaryColor1,
                  )
                : Image.asset('assets/images/ChatIcon.png'),
            label: 'Connect',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 3
                ? Image.asset(
                    'assets/images/reporticon .png',
                  )
                : Image.asset('assets/images/reporticon .png'),
            label: 'Report',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: primaryColor1,
        onTap: onItemTapped,
      ),
    );
  }
}
