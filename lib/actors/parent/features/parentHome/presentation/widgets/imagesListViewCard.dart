import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/models/eventsModel.dart';
import 'package:necessities/core/styles.dart';

class ImagesListViewCard extends StatelessWidget {
  const ImagesListViewCard({
    super.key,
    required this.width,
    required this.event,
  });
  final EventModel event;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        height: 150,
        width: 359,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.amber,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                event.image,
                width: width,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                event.text,
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
      ),
    );
  }
}
