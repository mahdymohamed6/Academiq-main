import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:necessities/constants.dart';
import 'package:necessities/core/resources/user_data.dart';

Future<String> fetchTeacherData() async {
  // final url = Uri.parse('http://13.60.57.85/users/65f8a5413a9824148869700c');
  String token = UserData().getToken();
  String id = GetStorage().read('id');
  final url = Uri.parse('${baseUrl}users/${id}');
  String courseId = '';
  final headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $token',
  };

  final response = await http.get(url, headers: headers);
  if (response.statusCode == 200) {
    Map<String, dynamic> responseData = jsonDecode(response.body);
    List<dynamic> courses = responseData['user']['courses'];

    courseId = courses[0]['_id'];
    print(courseId);

    // StudentData().saveData(id: id);
    // StudentData().saveCourseIds(courseId); // assuming you have this method
  } else {
    print('Request failed with status: ${response.statusCode}.');
    print(response.body);
  }
  return courseId;
}
