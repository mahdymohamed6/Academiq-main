import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:necessities/constants.dart';

abstract class LoginService {
  factory LoginService(http.Client httpClient) => HttpLoginService(httpClient);

  Future<http.Response> login(
      {required String endPoint,
      required String email,
      required String password});
}

class HttpLoginService implements LoginService {
  final http.Client _httpClient;

  HttpLoginService(this._httpClient);

  @override
  Future<http.Response> login(
      {required String endPoint,
      required String email,
      required String password}) async {
    final url = Uri.parse(baseUrl + '$endPoint');

    var response = await _httpClient.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"email": email, "password": password}),
    );
    return response;
  }
}
