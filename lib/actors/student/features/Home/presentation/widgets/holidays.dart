import 'package:flutter/material.dart';
import 'package:necessities/core/styles.dart';

class Holidays extends StatefulWidget {
  const Holidays({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  State<Holidays> createState() => _HolidaysState();
}

class _HolidaysState extends State<Holidays> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height * 0.2,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/ss.png',
              width: widget.width,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'Public \nHolidays',
              style: Style().title.copyWith(
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 25,
                    ),
                  ],
                  fontSize: 38,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
