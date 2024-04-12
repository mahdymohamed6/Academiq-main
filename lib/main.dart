import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/view/parentHomeView.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/pages/Attendance.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/pages/ExamScreen.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/pages/TeacherControlPage/TeacherControlPage.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/pages/classView.dart';

import 'actors/student/features/Splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: TeacherControlPage());
  }
}
