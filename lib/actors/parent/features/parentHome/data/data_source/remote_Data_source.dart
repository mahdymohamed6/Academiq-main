import 'package:get_storage/get_storage.dart';
import 'package:necessities/actors/parent/data/Models/timetable/student_timetable/student_timetable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:necessities/constants.dart';

class TimetableService {
  Future<StudentTimetable> getTimetable({required String id}) async {
    final url = Uri.parse(baseUrl + 'gradeClasses/${id}/timetables');
    final token = GetStorage().read('token');

    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> timetable = jsonDecode(response.body);

      print('grade Classes are' + '${timetable}');
      return StudentTimetable.fromJson(timetable);
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
