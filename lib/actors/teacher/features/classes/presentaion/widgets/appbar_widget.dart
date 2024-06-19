import 'package:flutter/material.dart';
import 'package:necessities/core/styles.dart';

final appBarSection = AppBar(
  backgroundColor: Colors.white,
  leading: IconButton(
    onPressed: () {},
    icon: const Icon(
      Icons.menu,
      color: Color(0xff00769E),
    ),
  ),
  centerTitle: true,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Grades',
        style: Style().title,
        textAlign: TextAlign.center,
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.keyboard_arrow_down_sharp,
          color: Color(0xff00769E),
        ),
      ),
    ],
  ),
  actions: [
    IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.notifications_rounded,
        color: Color(0xff00769E),
      ),
    )
  ],
);
