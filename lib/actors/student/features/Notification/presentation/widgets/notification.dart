import 'package:flutter/material.dart';
import 'package:necessities/actors/student/features/Notification/data/models/notification_model/notification_model.dart';
import 'package:necessities/constants.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({
    super.key,
    required this.width,
    required this.height,
    required this.notificationModel,
  });

  final double width;
  final double height;
  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: notificationColor,
      width: width,
      height: height * 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CircleAvatar(
            //   radius: 35,
            //   backgroundImage: NetworkImage(notificationModel.),
            // ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notificationModel.message!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                        fontSize: 15),
                  ),
                  Text(
                    "${notificationModel.date!.day.toString()} days ago",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz_outlined))
          ],
        ),
      ),
    );
  }
}
