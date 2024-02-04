import 'package:flutter/material.dart';

class AvtarStack extends StatelessWidget {
  const AvtarStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 14,
      ),
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              color: const Color.fromRGBO(247, 197, 191, 1)),
          child: Image.asset('assets/images/girlAvtar.png'),
        ),
        Positioned(
          top: 23,
          left: 23,
          child: Container(
            width: 18,
            height: 16,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: const Color.fromRGBO(206, 195, 255, 1)),
            child: Image.asset('assets/images/manAvtar.png'),
          ),
        ),
      ]),
    );
  }
}
