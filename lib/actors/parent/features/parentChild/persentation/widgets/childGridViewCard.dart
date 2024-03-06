import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/Child/presentation/pages/childinfoScreen.dart';
import 'package:necessities/actors/parent/features/Child/presentation/pages/profileContent.dart';

class ChildGridViewCard extends StatefulWidget {
  const ChildGridViewCard({super.key, required this.isSelected});
  final bool isSelected;
  @override
  State<ChildGridViewCard> createState() => _ChildGridViewCardState();
}

class _ChildGridViewCardState extends State<ChildGridViewCard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double leftPosition = (width * 0.25 - 35) /
        2; // Half the difference between the container width and avatar width

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment:
              Alignment.center, // Align the children in the center of the stack
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: (widget.isSelected) ? height : height * 0.25,
                width: (widget.isSelected) ? width * .9 : width * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0XFFFFD4B8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 40, left: 8, right: 8),
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
                  ],
                ),
              ),
            ),
            if (widget.isSelected)
              Positioned(
                top: -15,
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
                    color: const Color.fromRGBO(255, 212, 184, 1),
                  ),
                  child: Image.asset('assets/images/girlAvtar.png'),
                ),
              ),
            if (!widget.isSelected)
              Positioned(
                top: -15,
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
                    color: const Color.fromRGBO(255, 212, 184, 1),
                  ),
                  child: Image.asset('assets/images/girlAvtar.png'),
                ),
              ),
          ],
        ));
  }
}
