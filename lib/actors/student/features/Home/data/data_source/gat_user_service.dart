import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:necessities/actors/student/features/Home/data/models/child/UserChildModel.dart';
import 'package:necessities/actors/student/features/Home/domain/entitiy/child_entity.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/resources/user_data.dart';

Future<ChildEntity> fetchUserData() async {
  // final url = Uri.parse('http://13.60.57.85/users/65f8a5413a9824148869700c');
  String id = UserData().getId();
  final url = Uri.parse('${baseUrl}users/${id}');
  String token = UserData().getToken();
  final headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $token',
  };
  ChildEntity childEntity = ChildEntity(
      id: '',
      fristName: '',
      secondtName: '',
      motherId: '',
      fatherId: '',
      userName: '',
      userId: '');
  final response = await http.get(url, headers: headers);
  if (response.statusCode == 200) {
    Map<String, dynamic> responseData = jsonDecode(response.body);
    // ignore: unused_local_variable
    childEntity = UserChildModel.fromJson(responseData['user']);
    print('succcses0000000000000000000000000000000000000000');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
  return childEntity;
}
