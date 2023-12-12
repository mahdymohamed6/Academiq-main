import 'package:flutter/material.dart';
import 'package:necessities/home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  Color targetBackgroundColor = Colors.white;
  Color textColor = Colors.black;
  LinearGradient linearBackColor = const LinearGradient(
    colors: [Colors.green, Colors.blue],
  );
  late AnimationController _controller;

  late Animation<Offset> _offsetAnimation;
  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 1800),
      vsync: this,
    );
    super.initState();
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 30),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
    Future.delayed(Duration(milliseconds: 2500), () {
      setState(() {
        targetBackgroundColor = Colors.transparent; // Set to transparent
        textColor = Colors.white;
      });
    });
    Future.delayed(Duration(seconds: 4), () {
      return Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return Home();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder<dynamic>(
        tween: ColorTween(begin: Colors.white, end: targetBackgroundColor),
        duration: Duration(milliseconds: 50),
        builder: (context, color, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: color == Colors.transparent ? linearBackColor : null,
            ),
            child: Center(
              child: SlideTransition(
                position: _offsetAnimation,
                child: Text(
                  'Academiq',
                  style: TextStyle(color: textColor, fontSize: 24),
                ),
              ),
            ),
          );
        },
      ),

      /* AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            color: backgroundColor,
            child: Center(
              child: SlideTransition(
                position: _offsetAnimation,
                child: Text(
                  'Academiq',
                  style: TextStyle(color: textColor, fontSize: 24),
                ),
              ),
            ),
          );
        },
      ), */
    );
  }
}
