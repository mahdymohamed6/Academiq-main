import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';

Widget buildAppBar(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;

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
        title: Image.asset(
          logo2,
          height: height * 0.1,
          width: width * 0.3,
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
