import 'package:necessities/core/resources/data_state.dart';
import 'package:necessities/login/domain/entities/user_entity/user_Entity.dart';

abstract class LoginRepository {
  Future<DataState<List<UserEntityModel>>> login(
      {required String email, required String password});
}
