import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:necessities/actors/student/features/Classes/data/models/OneCourse/one_course/one_course.dart';
import 'package:necessities/actors/student/features/Classes/data/models/courses/course.dart';
import 'package:necessities/actors/student/features/Classes/data/models/courses/courses.dart';
import 'package:necessities/constants.dart';
import 'package:http/http.dart' as http;

class CoursesService {
  Future<Courses> getCourses() async {
    final url = Uri.parse(baseUrl + 'courses/');
    final token = GetStorage().read('token');

    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> courses = jsonDecode(response.body);

      print('course are' + '${courses}');
      return Courses.fromJson(courses);
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<OneCourse> getCourseById({required String id}) async {
    final url = Uri.parse(baseUrl + 'courses/$id');
    final token = GetStorage().read('token');

    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> courses = jsonDecode(response.body);

      print('course are' + '${courses}');
      return OneCourse.fromJson(courses);
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
