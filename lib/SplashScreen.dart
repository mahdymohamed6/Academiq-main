import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/view/parentHomeView.dart';
import 'package:necessities/actors/student/features/controlPage/ControlPage.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/pages/TeacherControlPage/TeacherControlPage.dart';
import 'package:necessities/login/presentation/pages/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) => {_checkAccess()});
  }

  void _checkAccess() async {
    var token = await GetStorage().read('token');
    var role = await GetStorage().read('role');
    if (token != null) {
      bool isExpired = JwtDecoder.isExpired(token);
      if (isExpired) {
        _redirectToLogin();
      } else {
        _redirectToRoleScreen(role);
      }
    } else {
      _redirectToLogin();
    }
  }

  void _redirectToLogin() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false,
    );
  }

  void _redirectToRoleScreen(String? role) {
    switch (role) {
      case 'student':
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ChildControlPage()),
          (route) => false,
        );
        break;
      case 'teacher':
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => TeacherHomePage()),
          (route) => false,
        );
        break;
      case 'parent':
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ParentHomeView()),
          (route) => false,
        );
        break;
      default:
        _redirectToLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    var role = GetStorage().read('role');
    return Scaffold(
      body: Center(
        child: Text(
          '$role',
          style: TextStyle(fontSize: 40, color: Colors.black),
        ),
      ),
    );
  }
}
