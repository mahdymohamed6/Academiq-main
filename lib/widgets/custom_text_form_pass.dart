import 'package:flutter/material.dart';

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
            ? GestureDetector(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: Icon(
                obscureText
                    ? Icons.remove_red_eye_outlined
                    : Icons.remove_red_eye,
                color: Colors.grey,
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
