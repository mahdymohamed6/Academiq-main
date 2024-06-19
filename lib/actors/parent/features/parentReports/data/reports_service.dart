import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:necessities/actors/parent/features/parentReports/data/models/report_model/report_model.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/resources/user_data.dart';

class ReportsService {
  Future<List<ReportModel>> fetchReports() async {
    // final url = Uri.parse('http://13.60.57.85/users/65f8a5413a9824148869700c');
    String token = UserData().getToken();
    final url = Uri.parse('${baseUrl}reports?sent=false');
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(url, headers: headers);
    List<ReportModel> reportsList = [];

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      List<dynamic> reports = responseData['reports'];
      for (var report in reports) {
        ReportModel reportModel = ReportModel.fromJson(report);
        reportsList.add(reportModel);
      }
      print(reportsList[1].body);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      // print(response.body);
    }
    return reportsList;
  }
}
