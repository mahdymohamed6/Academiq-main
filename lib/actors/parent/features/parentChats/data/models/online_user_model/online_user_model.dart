import 'name.dart';
import 'profile_picture.dart';

class OnlineUserModel {
  String? id;
  String? userId;
  Name? name;
  String? email;
  String? role;
  String? gender;
  String? gradeClassId;
  int? points;
  ProfilePicture? profilePicture;
  String? socketId;

  OnlineUserModel({
    this.id,
    this.userId,
    this.name,
    this.email,
    this.role,
    this.gender,
    this.gradeClassId,
    this.points,
    this.profilePicture,
    this.socketId,
  });

  factory OnlineUserModel.fromJson(Map<String, dynamic> json) {
    return OnlineUserModel(
      id: json['_id'] as String?,
      userId: json['userId'] as String?,
      name: json['name'] == null
          ? null
          : Name.fromJson(json['name'] as Map<String, dynamic>),
      email: json['email'] as String?,
      role: json['role'] as String?,
      gender: json['gender'] as String?,
      gradeClassId: json['gradeClassId'] as String?,
      points: json['points'] as int?,
      profilePicture: json['profilePicture'] == null
          ? null
          : ProfilePicture.fromJson(
              json['profilePicture'] as Map<String, dynamic>),
      socketId: json['socketId'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userId': userId,
        'name': name?.toJson(),
        'email': email,
        'role': role,
        'gender': gender,
        'gradeClassId': gradeClassId,
        'points': points,
        'profilePicture': profilePicture?.toJson(),
        'socketId': socketId,
      };
}
