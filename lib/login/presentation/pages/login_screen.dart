import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:necessities/actors/parent/features/ParentControlPage/parentControlPage.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/pages/TeacherControlPage/TeacherControlPage.dart';
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
                      return Center(child: CircularProgressIndicator());
                    } else if (state is LoginSuccess) {
                      return CustomizedButton();
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
          MaterialPageRoute(builder: (context) => TeacherHomePage()),
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

/* 



class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({super.key});

  @override
  State<MyLoginScreen> createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
 

  final LoginBloc loginBloc = sl<LoginBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 69, 69, 69),
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextFormField(
              hint: 'Email',
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty || !value.contains('@')) {
                  return 'Please enter a valid Email';
                }
                return null;
              },
            ),
            CustomTextFormField(
              hint: 'Password',
              controller: passwordController,
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 6) {
                  return 'Please enter a valid password';
                }
                return null;
              },
            ),
            BlocConsumer(
                bloc: loginBloc,
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is LoginSuccess) {
                    return AuthContainer();
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
                      child: AuthContainer());
                },
                listener: (context, state) {
                 if (state is LoginSuccess) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Success')));
                    ;
                  } 
                }),
          ],
        ),
      ),
    );
  }
}


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.controller,
    this.validator,
  });
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: TextFormField(
        validator: validator,
        controller: controller,
        textAlign: TextAlign.center, // Center-align the text
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}


 */
