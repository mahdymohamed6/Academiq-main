import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';

class ImagesListViewCard extends StatelessWidget {
  const ImagesListViewCard({
    super.key,
    required this.width,
    required this.discussion,
  });
  final discussion;
  final double width;

  @override
  Widget build(BuildContext context) {
    if (discussion.attachments.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: width * 0.8,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              discussion.content,
              style: Style().title.copyWith(
                    fontSize: 16,
                    color: primaryColor1,
                  ),
            ),
          ),
        ),
      );
    } else {
      return Container(
        width: width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: discussion.attachments.length,
            itemBuilder: (context, index) {
              final image = discussion.attachments[index];
              return ClipRRect(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    image,
                    width: width,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      );
    }
  }
}
