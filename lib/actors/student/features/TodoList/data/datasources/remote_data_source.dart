import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:necessities/actors/student/features/TodoList/Presentation/widgets/add_ToDo.dart';
import 'package:necessities/actors/student/features/TodoList/data/models/todo_model/todo_model.dart';

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
        "title": title,
        "description": description,
        'schedule': schedule.toIso8601String(),
      }),
    );

    return response;
  }

  Future<TodoModel> getTodo(
      {required String token, required String date}) async {
    final url = Uri.parse(baseUrl + 'todos?date=$date');

    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> allTodo = jsonDecode(response.body);
      print(allTodo);
      return TodoModel.fromJson(allTodo);
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<void> deleteTodo({required String id}) async {
    final url = Uri.parse(baseUrl + 'todos/$id');
    final String token = GetStorage().read('token');
    final response = await http.delete(url, headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      print('deleted successfully address List');
    } else {
      print(response.body);
      print(response.statusCode);
    }
  }

  Future<http.Response> updateTodo(
      {required String title,
      required String description,
      required DateTime schedule,
      bool? completed,
      required String id}) async {
    final url = Uri.parse(baseUrl + 'todos/$id');
    String token = UserData().getToken();

    final response = await http.put(url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "title": title,
          "description": description,
          'schedule': schedule.toIso8601String(),
          'completed': completed
        }));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final todo = responseData['message'];
      print(todo);
    } else {
      print(response.body);
      print(response.request);
      print(response.statusCode);
    }
    return response;
  }
}
