import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';
import 'package:necessities/core/resources/data_state.dart';
import 'package:necessities/login/domain/entities/user_entity/user.dart';
import 'package:necessities/login/domain/entities/user_entity/user_Entity.dart';
import 'package:necessities/login/domain/usecases/LoginUseCase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase) : super(const LoginInitial()) {
    on<LoginE>(LogingIn);
  }

  void LogingIn(LoginE event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    final loginParams =
        LoginParams(email: event.email, password: event.password);

    final dataState = await _loginUseCase(loginParams);
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(LoginSuccess(dataState.data!));
      print('successsss');
    }

    if (dataState is DataFailed) {
      emit(LoginError(err: 'some wrong'));
    }
  }
}
