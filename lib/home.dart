import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/widgets/custom_login_button.dart';
import 'package:necessities/widgets/custom_text_form_field.dart';
import 'package:necessities/widgets/custom_text_form_pass.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
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

final _formKey = GlobalKey<FormState>();

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Log in',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor1,
                ),
              ),
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
                  const CustomizedTextFormField(
                    hint: 'enter your email',
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
                  const CustomizedTextFormFieldPass(
                    hint: 'password',
                    showSuffixIcon: true,
                    obscureText: true,
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
              const CustomizedButton(),
            ],
          ),
        ),
      ),
    );
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
    return Text(
      text,
      style: TextStyle(
        fontSize: 15,
        color: color,
      ),
    );
  }
}
