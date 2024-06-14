import 'user.dart';

class TeacherData {
  User? user;

  TeacherData({this.user});

  factory TeacherData.fromJson(Map<String, dynamic> json) => TeacherData(
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
      };
}
