import 'package:flutter/material.dart';
import 'package:necessities/home.dart';
import 'package:necessities/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: Splash());
  }
}
