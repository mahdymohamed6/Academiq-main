import 'name.dart';
import 'profile_picture.dart';

class Member {
  String? id;
  String? userId;
  Name? name;
  String? email;
  String? role;
  String? gender;
  ProfilePicture? profilePicture;

  Member({
    this.id,
    this.userId,
    this.name,
    this.email,
    this.role,
    this.gender,
    this.profilePicture,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json['_id'] as String?,
        userId: json['userId'] as String?,
        name: json['name'] == null
            ? null
            : Name.fromJson(json['name'] as Map<String, dynamic>),
        email: json['email'] as String?,
        role: json['role'] as String?,
        gender: json['gender'] as String?,
        profilePicture: json['profilePicture'] == null
            ? null
            : ProfilePicture.fromJson(
                json['profilePicture'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userId': userId,
        'name': name?.toJson(),
        'email': email,
        'role': role,
        'gender': gender,
        'profilePicture': profilePicture?.toJson(),
      };
}
