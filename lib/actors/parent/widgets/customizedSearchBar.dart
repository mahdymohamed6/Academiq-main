import 'package:flutter/material.dart';
import 'package:necessities/core/styles.dart';

class CustomizedSearchBar extends StatelessWidget {
  const CustomizedSearchBar({
    super.key,
    required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          height: 40,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 11.0, right: 13),
                child: Icon(
                  Icons.search,
                  color: Colors.grey.withOpacity(0.5),
                  size: 25,
                ),
              ),
              Text(text,
                  style: Style().title.copyWith(
                      color: Colors.grey.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      ),
    );
  }
}
