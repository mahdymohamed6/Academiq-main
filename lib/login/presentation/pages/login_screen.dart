import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:necessities/actors/parent/features/ParentControlPage/parentControlPage.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/pages/TeacherControlPage/TeacherControlPage.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/pages/teacherClasses.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';
import 'package:necessities/actors/student/features/Login/presentation/widgets/custom_login_button.dart';
import 'package:necessities/actors/student/features/Login/presentation/widgets/custom_text_form_field.dart';
import 'package:necessities/actors/student/features/Login/presentation/widgets/custom_text_form_pass.dart';
import 'package:necessities/injection_container.dart';
import 'package:necessities/login/presentation/blocs/login/login_bloc.dart';

import '../../../actors/student/features/controlPage/ControlPage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 2.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));

    // Start the animation
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [primaryColor1, secondaryColor1],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image.asset(
                '$logo1',
                width: 200,
                height: MediaQuery.of(context).size.height * 0.4,
              ),
            ),
            Expanded(
              child: SlideTransition(
                position: _offsetAnimation,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height *
                      0.6, // Adjust the height
                  child:
                      Center(child: SingleChildScrollView(child: LoginBody())),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final LoginBloc loginBloc = sl<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    var role = GetStorage().read('role');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Log in',
                  style: Style().title.copyWith(color: primaryColor1)),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomizedText(
                    text: 'Email',
                    color: primaryColor2,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomizedTextFormField(
                    hint: 'enter your email',
                    controller: emailController,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains('@')) {
                        return 'Please enter a valid Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomizedText(
                    text: 'Password',
                    color: primaryColor2,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomizedTextFormFieldPass(
                    hint: 'password',
                    showSuffixIcon: true,
                    obscureText: true,
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return 'Please enter a valid password';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 9,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomizedText(
                    text: 'Forget password',
                    color: primaryColor2,
                  ),
                ],
              ),
              const SizedBox(
                height: 45,
              ),
              BlocConsumer(
                  bloc: loginBloc,
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: primaryColor1),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      );
                    } else if (state is LoginSuccess) {
                      return Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: primaryColor1),
                        child: Center(
                          child: Text(
                            'Log in',
                            style: Style().title.copyWith(color: Colors.white),
                          ),
                        ),
                      );
                    }
                    return GestureDetector(
                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                          loginBloc.add(LoginE(
                            email: emailController.text,
                            password: passwordController.text,
                          ));
                        }
                      },
                      child: CustomizedButton(),
                    );
                  },
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('$role')));
                      _checkAccess();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
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
          MaterialPageRoute(builder: (context) => TeacherClasses()),
          (route) => false,
        );
        break;
      case 'parent':
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ParentHomePage()),
          (route) => false,
        );
        break;
      default:
        _redirectToLogin();
    }
  }
}

class CustomizedText extends StatelessWidget {
  const CustomizedText({
    super.key,
    required this.text,
    required this.color,
  });
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Style().title.copyWith(color: color, fontSize: 15));
  }
}
