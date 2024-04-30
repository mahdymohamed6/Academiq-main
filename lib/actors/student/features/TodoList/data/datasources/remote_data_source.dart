import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:necessities/constants.dart';
import 'package:necessities/core/resources/user_data.dart';

 class TodoListService {
  Future<http.Response> addTodoList(
      {required String title,
      required String description,
      required DateTime schedule}) async {
    final url = Uri.parse(baseUrl + 'todos');
    String token = UserData().getToken();

    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "title": title, "description": description,
        'schedule': schedule.toIso8601String(), 
      }),
    );
   
    return response;
  }
}
