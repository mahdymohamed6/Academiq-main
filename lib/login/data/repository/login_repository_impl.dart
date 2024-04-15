import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:necessities/core/resources/data_state.dart';
import 'package:necessities/core/resources/user_data.dart';
import 'package:necessities/login/data/data_source/remote/login_service.dart';
import 'package:necessities/login/data/models/user_model/user_model.dart';
import 'package:necessities/login/domain/entities/user_entity/user_model.dart';
import 'package:necessities/login/domain/repository/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginService _loginService;

  LoginRepositoryImpl(this._loginService);

  @override
  Future<DataState<List<UserModel>>> login(
      {required String email, required String password}) async {
    try {
      final response = await _loginService.login(
          endPoint: 'auth/login', email: email, password: password);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final token = responseData['token'];
        final role = responseData['user']['role'];
                final gender = responseData['user']['gender'];

        print('token is'+ role);
        UserData().saveData(role: role,token: token);
        return DataSuccess([UserModel.fromJson(responseData)]);
      } else {
        print('failed: ${response.body}');
        return DataFailed(DioException(
            requestOptions: RequestOptions(), message: response.body));
      }
    } catch (e) {
      return DataFailed(DioException(
        requestOptions: RequestOptions(),
      ));
    }
  }
}
