import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/Login.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool changeColors = false;
  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    super.initState();
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 30),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        changeColors = true; // Set to transparent
      });
    });
     Future.delayed(Duration(seconds: 5), () {
      return Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return LoginScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: changeColors ? linearBackgroundColor : null,
          ),
          child: Center(
            child: SlideTransition(
              position: _offsetAnimation,
              child: changeColors
                  ? Image.asset(
                      logo1,
                      width: 200,
                      height: 200,
                    )
                  : Image.asset(
                      logo2,
                      width: 200,
                      height: 200,
                    ),
            ),
          )),
    );
  }
}
