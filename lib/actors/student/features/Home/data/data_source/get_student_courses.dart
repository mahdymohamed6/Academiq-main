import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:necessities/actors/student/features/Home/domain/entitiy/cours_entity.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/resources/student_data.dart';
import 'package:necessities/core/resources/user_data.dart';

Future<List<CourseEntity>> getStudentCourses() async {
  String token = UserData().getToken();
  String id = StudentData().getGradeClassId();
  final url =
      Uri.parse('${baseUrl}courses/gradeClasses/65f8a5a13a98241488697014');

  final headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $token',
  };

  final response = await http.get(url, headers: headers);
  List<CourseEntity> coursesList = [];

  if (response.statusCode == 200) {
    Map<String, dynamic> responseData = jsonDecode(response.body);
    List<dynamic>? courses = responseData['courses'];

    if (courses != null && courses.isNotEmpty) {
      for (var course in courses) {
        DateTime startDate = DateTime.parse(course['schedule']['startDate']);
        DateTime endDate = DateTime.parse(course['schedule']['endDate']);
        String startTime = DateFormat('HH:mm').format(startDate);
        String endTime = DateFormat('HH:mm').format(endDate);
        CourseEntity courseEntity = CourseEntity(
            startDate: startTime,
            endDate: endTime,
            courseId: course['courseId'],
            title: course['title'],
            department: course['department']);
        coursesList.add(courseEntity);
      }
    }
  } else {
    print(response.body);
    print('StatusCode: ${response.statusCode}');
  }

  return coursesList;
}
