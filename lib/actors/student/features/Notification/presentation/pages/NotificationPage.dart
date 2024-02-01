import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/actors/student/features/Notification/presentation/widgets/notification.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 20,
            ),
            AppBar(
              elevation: 0,
              scrolledUnderElevation: 0,
              automaticallyImplyLeading: false,
              title: Text(
                'Notification',
                style: TextStyle(
                  color: primaryColor1,
                  fontWeight: FontWeight.w300,
                  fontSize: 25,
                  fontFamily: 'Poppins',
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Row(
                    children: [
                      Text(
                        'filter',
                        style: TextStyle(
                          color: primaryColor1,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Image.asset('assets/images/filter_icon.png')
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: primaryColor1,
            thickness: 0.1,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              'New',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return NotificationContainer(width: width, height: height);
                }),
          )
        ],
      ),
    );
  }
}
