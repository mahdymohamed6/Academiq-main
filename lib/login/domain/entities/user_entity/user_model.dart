import 'package:equatable/equatable.dart';

import 'user.dart';

class UserEntityModel extends Equatable {
  final String? message;
  final String? token;
  final UserEntity? user;

  const UserEntityModel({this.message, this.token, this.user});

  

  @override
  List<Object?> get props => [message, token, user];
}
