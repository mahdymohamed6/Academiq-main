import 'package:equatable/equatable.dart';
import 'package:necessities/login/domain/entities/user_entity/user_model.dart';

import 'user.dart';

class UserModel extends UserEntityModel {
  final String? message;
  final String? token;
  final User? user;

  const UserModel({this.message, this.token, this.user});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json['message'] as String?,
        token: json['token'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'token': token,
        'user': user?.toJson(),
      };

  @override
  List<Object?> get props => [message, token, user];
}
