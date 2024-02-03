import 'package:flutter/material.dart';

class ChildGridViewCard extends StatelessWidget {
  const ChildGridViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        height: 136,
        width: 94,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color.fromRGBO(255, 212, 184, 1)),
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(top: 23, left: 8, right: 8),
            child: Text(
              'Jane Cooper',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w300,
                fontFamily: 'Poppins',
                color: Color.fromRGBO(0, 118, 158, 1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Image.asset(
              'assets/images/girlReading.png',
              width: 77,
              height: 83,
            ),
          ),
        ]),
      ),
      Positioned(
        left: 21,
        bottom: 117,
        child: Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 3,
                  offset: Offset(0, 4),
                ),
              ],
              borderRadius: BorderRadius.circular(200),
              color: const Color.fromRGBO(255, 212, 184, 1)),
          child: Image.asset('assets/images/girlAvtar.png'),
        ),
      ),
    ]);
  }
}
