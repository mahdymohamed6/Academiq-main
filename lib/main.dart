import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/page/parentHomeView.dart';

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
        home: ParentHomeView());
  }
}
