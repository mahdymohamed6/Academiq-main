import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/Child/presentation/pages/childinfoScreen.dart';
import 'package:necessities/actors/student/features/controlPage/ControlPage.dart';

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
        home: ChildInfoScreen());
  }
}
