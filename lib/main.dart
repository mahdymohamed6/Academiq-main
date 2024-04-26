import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:necessities/SplashScreen.dart';
import 'package:necessities/actors/student/features/Home/presentation/pages/home.dart';
import 'package:necessities/block_observer.dart';

import 'package:necessities/injection_container.dart';
import 'package:necessities/login/presentation/blocs/login/login_bloc.dart';
import 'package:necessities/login/presentation/pages/login_screen.dart';

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
        BlocProvider<LoginBloc>(create: (context) => sl<LoginBloc>())
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: StudentHomeScreen()),
    );
  }
}
