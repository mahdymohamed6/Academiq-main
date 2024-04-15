import 'package:flutter/material.dart';
import 'package:necessities/core/styles.dart';

class CustomizedButton extends StatelessWidget {
  const CustomizedButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
    this.onTap,
  });
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: width * 0.4,
          height: height * 0.06,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: backgroundColor,
              border: Border.all(color: borderColor)),
          child: Center(
            child: Text(
              text,
              style: Style().title.copyWith(color: textColor, fontSize: 18),
            ),
          ),
        ));
  }
}
