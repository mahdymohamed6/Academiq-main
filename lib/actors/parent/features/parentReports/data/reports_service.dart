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
      print(reportsList[0].from!.name!.first);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      // print(response.body);
    }
    return reportsList;
  }

  Future<bool> sendReply(
      {required String content, required String reportId}) async {
    final url = Uri.parse(baseUrl + 'reports/${reportId}/reply');
    String token = UserData().getToken();
    print(content);
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "body": content,
      }),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      print('reply is sent successfuly');
      print(responseData);
      return (true);
    } else {
      print(response.body);
      print(response.statusCode);
      return (false);
    }
  }
}
