import 'UserChildModel.dart';

class Child {
  String? message;
  UserChildModel? user;

  Child({this.message, this.user});

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        message: json['message'] as String?,
        user: json['user'] == null
            ? null
            : UserChildModel.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'user': user?.toJson(),
      };
}
