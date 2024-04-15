import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:necessities/SplashScreen.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/view/parentHomeView.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/pages/Attendance.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/pages/ExamScreen.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/pages/TeacherControlPage/TeacherControlPage.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/pages/classView.dart';
import 'package:necessities/injection_container.dart';
import 'package:necessities/login/presentation/blocs/login/login_bloc.dart';
import 'package:necessities/login/presentation/pages/login_screen.dart';

import 'actors/student/features/Splash/splash.dart';

Future<void> main()async {
 await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context)=>sl<LoginBloc>())
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: SplashScreen()),
    );
  }
}
