import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.progress,
  });
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: 13,
              decoration: BoxDecoration(
                color: Colors.grey.shade300, // Grey background color
                borderRadius: BorderRadius.circular(22),
              ),
            ),
            Container(
              height: 10,
              width: MediaQuery.of(context).size.width * 0.4 * (progress / 100),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(22)),
            ),
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '${progress}%',
          style: TextStyle(
            color: Colors.grey.shade900,
            fontSize: 9,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}