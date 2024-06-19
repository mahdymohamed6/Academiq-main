import 'dart:async';

import 'package:flutter/material.dart';
import 'package:necessities/actors/student/features/Notification/data/get_notification.dart';
import 'package:necessities/actors/student/features/Notification/data/models/notification_model/notification_model.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/actors/student/features/Notification/presentation/widgets/notification.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationModel> notificationsList = [];
  bool isLoading = false;

  @override
  void initState() {
    getNotifications();
    super.initState();
  }

  Future<void> getNotifications() async {
    setState(() {
      isLoading = true;
    });
    final notifications = await NotificationService().fetchUserNotification();
    setState(() {
      notificationsList = notifications;
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 20,
            ),
            AppBar(
              elevation: 0,
              scrolledUnderElevation: 0,
              automaticallyImplyLeading: false,
              title: InkWell(
                onTap: () {
                  print(notificationsList.length);
                },
                child: Text(
                  'Notification',
                  style: TextStyle(
                    color: primaryColor1,
                    fontWeight: FontWeight.w300,
                    fontSize: 25,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.arrow_back, color: primaryColor1))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: primaryColor1,
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  color: primaryColor1,
                  thickness: 0.1,
                  indent: 20,
                  endIndent: 20,
                ),
                Expanded(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: notificationsList.length,
                      itemBuilder: (context, index) {
                        return NotificationContainer(
                          width: width,
                          height: height,
                          notificationModel: notificationsList[index],
                        );
                      }),
                )
              ],
            ),
    );
  }
}
