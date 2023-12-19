import 'package:flutter/material.dart';
import 'package:necessities/features/Home/presentation/pages/home.dart';
import 'package:necessities/features/Login/presentation/pages/Login.dart';
import 'package:necessities/features/Splash/splash.dart';
import 'package:necessities/features/TodoList/Presentation/pages/TodoScreen.dart';

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
        home: Splash());
  }
}
