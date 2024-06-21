import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:necessities/actors/student/features/TodoList/Presentation/blocs/bloc/todo_bloc.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/bloc/attendanceBloc/bloc/attendance_bloc.dart';
import 'package:necessities/block_observer.dart';
import 'package:necessities/core/styles.dart';

import 'package:necessities/injection_container.dart';
import 'package:necessities/login/presentation/blocs/login/login_bloc.dart';
import 'package:necessities/login/presentation/pages/login_screen.dart';

import 'constants.dart';

Future<void> main() async {
  await initializeDependencies();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => sl<LoginBloc>()),
        BlocProvider(create: (context) => TodoBloc()),
        BlocProvider(create: (context) => AttendanceBloc()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: LoginScreen()),
    );
  }
}
