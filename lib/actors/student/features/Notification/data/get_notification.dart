import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:necessities/actors/student/features/Notification/data/models/notification_model/notification_model.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/resources/user_data.dart';

class NotificationService {
  Future<List<NotificationModel>> fetchUserNotification() async {
    // final url = Uri.parse('http://13.60.57.85/users/65f8a5413a9824148869700c');
    String token = UserData().getToken();
    final url = Uri.parse('${baseUrl}users/notifications');
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
    List<NotificationModel> notificationsList = [];
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      List<dynamic>? notifications = responseData['notifications'];
      for (var notification in notifications!) {
        NotificationModel notificationModel =
            NotificationModel.fromJson(notification);
        notificationsList.add(notificationModel);
      }

      // print(notificationList[1].message);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      print(response.body);
    }
    return notificationsList;
  }
}
