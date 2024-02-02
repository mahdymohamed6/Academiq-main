import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: notificationColor,
      width: width,
      height: height * 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage:
                  AssetImage('assets/images/woman.png'),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description I want to easily view the titles of tasks or assignments assigned by my teachers .',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',fontSize: 15
                    ),
                  ),
                  Text(
                    '12 hours ago',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz_outlined))
          ],
        ),
      ),
    );
  }
}
