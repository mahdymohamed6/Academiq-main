import 'package:necessities/core/resources/data_state.dart';
import 'package:necessities/core/usecases/usecase.dart';
import 'package:necessities/login/domain/entities/user_entity/user_Entity.dart';
import 'package:necessities/login/domain/repository/login_repository.dart';

class LoginUseCase
    implements UseCase<DataState<List<UserEntityModel>>, LoginParams> {
  final LoginRepository _loginRepository;
  LoginUseCase(this._loginRepository);

  @override
  Future<DataState<List<UserEntityModel>>> call(LoginParams params) {
    return _loginRepository.login(
        email: params.email, password: params.password);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
