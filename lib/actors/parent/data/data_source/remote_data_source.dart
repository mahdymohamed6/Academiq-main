import 'package:get_storage/get_storage.dart';
import 'package:necessities/actors/parent/data/Models/Reports/reports/reports.dart';
import 'package:necessities/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:necessities/core/resources/user_data.dart';

class ReportsServices {
  Future<Reports> getReports() async {
    final url = Uri.parse(baseUrl + 'reports/');
    final token = GetStorage().read('token');

    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> reports = jsonDecode(response.body);

      print('grade Classes are' + '${reports}');
      return Reports.fromJson(reports);
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<void> sendReply(
      {required String content, required String reportId}) async {
    final url = Uri.parse(baseUrl + 'reports/${reportId}/reply');
    String token = UserData().getToken();

    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "content": content,
      }),
    );
    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      print('reply is sent successfuly');
      print(responseData);
    } else {
      print(response.body);
      print(response.request);
      print(response.statusCode);
    }
  }
}
