import 'package:flutter/material.dart';

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
      duration: Duration(seconds: 3),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 2.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));

    // Start the animation
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.blue, Colors.green],
        )),
        child: Stack(
          children: [
            const Center(
              child: Text(
                'Academiq',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            Positioned(
              bottom: 0,
              child: SlideTransition(
                position: _offsetAnimation,
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.65,
                    child: const Center(
                      child: LoginBody(),
                    ),
                  ),
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

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 44),
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: [Colors.blue, Colors.green],
                stops: [0.0, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            child: const Text(
              'Login in',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomizedText(
                text: 'Email',
              ),
              SizedBox(
                height: 12,
              ),
              CustomizedTextFormField(
                hint: 'enter your email',
              ),
              SizedBox(
                height: 20,
              ),
              CustomizedText(text: 'Password'),
              SizedBox(
                height: 12,
              ),
              CustomizedTextFormFieldPass(
                hint: 'password',
                showSuffixIcon: true,
                obscureText: true,
              ),
            ],
          ),
          const SizedBox(
            height: 9,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomizedText(text: 'Forget password'),
            ],
          ),
          const SizedBox(
            height: 45,
          ),
          const CustomizedButton(),
        ],
      ),
    );
  }
}

// widget
class CustomizedButton extends StatelessWidget {
  const CustomizedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: 49,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
              colors: [Colors.blue, Colors.green],
            )),
        child: const Center(
          child: Text(
            'Log in',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// widget
class CustomizedTextFormField extends StatelessWidget {
  const CustomizedTextFormField({
    super.key,
    this.showSuffixIcon = false,
    required this.hint,
    this.obscureText = false,
  });
  final bool showSuffixIcon;
  final String hint;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 96, 95, 95), width: 1.7),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 96, 95, 95), width: 1.7),
        ),
        suffixIcon: showSuffixIcon
            ? ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [Colors.blue, Colors.green],
                  ).createShader(bounds);
                },
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.white, // Adjust the icon color as needed
                  ),
                ),
              )
            : null,
      ),
      style: const TextStyle(
        color: Colors.grey,
      ),
    );
  }
}

class CustomizedTextFormFieldPass extends StatefulWidget {
  const CustomizedTextFormFieldPass({
    Key? key,
    this.showSuffixIcon = false,
    required this.hint,
    this.obscureText = false,
  }) : super(key: key);

  final bool showSuffixIcon;
  final String hint;
  final bool obscureText;
  @override
  _CustomizedTextFormFieldPassState createState() =>
      _CustomizedTextFormFieldPassState();
}

class _CustomizedTextFormFieldPassState
    extends State<CustomizedTextFormFieldPass> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: (value) {
        setState(() {}); // Rebuild the widget when the text changes
      },
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
        hintText: widget.hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 96, 95, 95),
            width: 1.7,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 96, 95, 95),
            width: 1.7,
          ),
        ),
        suffixIcon: widget.showSuffixIcon
            ? ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [Colors.blue, Colors.green],
                  ).createShader(bounds);
                },
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(
                    obscureText
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye,
                    color: Colors.white,
                  ),
                ),
              )
            : null,
      ),
      style: const TextStyle(
        color: Colors.grey,
      ),
    );
  }
}
// widget

class CustomizedText extends StatelessWidget {
  const CustomizedText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [Colors.blue, Colors.green],
          stops: [0.0, 1.0],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(bounds);
      },
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
