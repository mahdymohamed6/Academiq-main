import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';

Widget buildTeacherAppBar(BuildContext context, String title,bool dropDown) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(90),
    child: Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: AppBar(
        iconTheme: IconThemeData(color: primaryColor1),
        scrolledUnderElevation: 0,
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: primaryColor1,
                  fontFamily: 'poppins'),
            ),
            if(dropDown) Padding(
              padding: const EdgeInsets.only(left: 12.84),
              child: PopupMenuButton<String>(
                onSelected: (String value) {
                  // Handle the selected value from the dropdown
                  print('Selected: $value');
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'Option 1',
                    child: Text('Option 1'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Option 2',
                    child: Text('Option 2'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Option 3',
                    child: Text('Option 3'),
                  ),
                ],
                child: Image.asset('assets/images/Vector.png'),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
    ),
  );
}
