part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginE extends LoginEvent {
  final String email;
  final String password;

  LoginE({required this.email, required this.password});
}
