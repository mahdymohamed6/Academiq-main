import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.progress,
  });
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 13,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300, // Grey background color
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
                Container(
                  height: 13,
                  width: MediaQuery.of(context).size.width *
                      0.7 *
                      (progress / 100),
                  decoration: BoxDecoration(
                      color: primaryColor1,
                      borderRadius: BorderRadius.circular(22)),
                ),
              ],
            ),
          ),
          Text(
            '${progress}%',
            style: TextStyle(
              color: Colors.grey.shade900,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}