import 'dart:convert';
import 'dart:io';

import 'package:necessities/actors/student/features/Assignment/domain/entities/assignment_entity.dart';
import 'package:necessities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:necessities/core/resources/user_data.dart';
import 'package:http_parser/http_parser.dart';

class AssignmentService {
  Future<List<AssignmentEntity>> getAssignments() async {
    final url =
        Uri.parse('${baseUrl}assessments?type=assignment&status=published');

    String token = UserData().getToken();
    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    List<AssignmentEntity> AssignmentList = [];
    if (response.statusCode == 200) {
      print('doneeeeeeeeeeee');
      final Map<String, dynamic> responsebody = jsonDecode(response.body);
      List<dynamic>? assessments = responsebody['assessments'];
      for (var assignmentt in assessments!) {
        AssignmentEntity assignment = AssignmentEntity.fromJson(assignmentt);
        AssignmentList.add(assignment);
      }
      // print(AssignmentList[3].title);
    } else {
      print(response.statusCode);
    }
    return AssignmentList;
  }

  Future<void> creatSubmission({required String assignmentId}) async {
    final url = Uri.parse('${baseUrl}submissions/assessments/$assignmentId');

    String token = UserData().getToken();

    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 201) {
      print('succ');
      print(response.body);

      // print(AssignmentList[3].title);
    } else {
      print('cration ${response.statusCode}');
      print(response.body);
    }
  }

  Future<bool> submitSubmission(
      {required String assignmentId, required File file}) async {
    final url =
        Uri.parse('${baseUrl}submissions/assessments/$assignmentId/submit');

    String token = UserData().getToken();
    print(assignmentId);
    var request = http.MultipartRequest('PATCH', url);
    request.headers['Authorization'] = 'Bearer $token';
    request.files.add(http.MultipartFile(
      'answers',
      file.readAsBytes().asStream(),
      file.lengthSync(),
      filename: 'answers.pdf',
      contentType: MediaType('application', 'pdf'),
    ));
    try {
      var response = await http.Response.fromStream(await request.send());
      if (response.statusCode == 201) {
        String responseBody = response.body;

        print('submited');

        print(responseBody);
        return true;
      } else {
        print('Failed to submit. Status code: ${response.statusCode}');
        String responseBody = response.body;
        print('Response body: $responseBody');
        return false;
      }
    } catch (e) {
      print('Error sending request: $e');
      return false;
    }
  }

  Future<void> updateAssessment({
    required String title,
    required String description,
    required DateTime startDate,
    required DateTime endDate,
    required String coursId,
    required int score,
    required String assessmentId,
  }) async {
    String token = UserData().getToken();
    // String userId = UserData().getId();

    final url = Uri.parse('${baseUrl}assessments/$assessmentId');

    String formattedStartDate =
        '${startDate.year}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')} ${startDate.hour.toString().padLeft(2, '0')}:${startDate.minute.toString().padLeft(2, '0')}';
    String formattedEndDate =
        '${endDate.year}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')} ${endDate.hour.toString().padLeft(2, '0')}:${endDate.minute.toString().padLeft(2, '0')}';

    var body = {
      "title": title,
      "description": description,
      "courseId": coursId,
      "startDate": formattedStartDate,
      "endDate": formattedEndDate,
      "score": score
    };
    var response = await http.put(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body)); // Don't forget to encode the body to JSON
    if (response.statusCode == 202) {
      print('succ');
      print(response.body);

      // print(AssignmentList[3].title);
    } else {
      print('cration ${response.statusCode}');
      print(response.body);
    }
  }

  Future<String> createAssignment() async {
    final url = Uri.parse('${baseUrl}assessments/');

    String token = UserData().getToken();

    // Convert the Map into a JSON-encoded string
    var requestBody = jsonEncode({"type": "assignment"});
    String assessmentId = '';
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: requestBody,
    );

    if (response.statusCode == 201) {
      print('createAssignment success');
      print(response.body);

      // Parse the response body to extract the _id
      final assessment = jsonDecode(response.body)['assessment'];
      assessmentId = assessment['_id'];
      print('Saved assessment ID: $assessmentId');
    } else {
      print('creation failed with status code ${response.statusCode}');
      print(response.body);
    }
    return assessmentId;
  }

  Future<bool> addMaterialToAssignment(
      {required String assessmentId, required File file}) async {
    final url = Uri.parse('${baseUrl}assessments/$assessmentId/materials');

    String token = UserData().getToken();
    // print(assignmentId);
    var request = http.MultipartRequest('PATCH', url);
    request.headers['Authorization'] = 'Bearer $token';
    request.files.add(http.MultipartFile(
      'materials',
      file.readAsBytes().asStream(),
      file.lengthSync(),
      filename: 'material.pdf',
      contentType: MediaType('application', 'pdf'),
    ));
    try {
      var response = await http.Response.fromStream(await request.send());
      if (response.statusCode == 201) {
        String responseBody = response.body;

        print('submited');

        print(responseBody);
        return true;
      } else {
        print('Failed to submit. Status code: ${response.statusCode}');
        String responseBody = response.body;
        print('Response body: $responseBody');
        return false;
      }
    } catch (e) {
      print('Error sending request: $e');
      return false;
    }
  }
}
