part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  final List<UserEntityModel>? users;
  final DioException? errors;

  const LoginState({this.users, this.errors});

  @override
  List<Object> get props => [users!, errors!];
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  const LoginSuccess(List<UserEntityModel> user) : super(users: user);
}

class LoginError extends LoginState {
  final String err;

  LoginError({required this.err});
}
