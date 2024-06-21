import 'package:equatable/equatable.dart';

import 'user.dart';

class UserModelTimeTable extends Equatable {
  final String? message;
  final String? token;
  final User? user;

  const UserModelTimeTable({this.message, this.token, this.user});

  factory UserModelTimeTable.fromJson(Map<String, dynamic> json) {
    return UserModelTimeTable(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'token': token,
        'user': user?.toJson(),
      };

  @override
  List<Object?> get props => [message, token, user];
}
