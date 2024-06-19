import 'package:equatable/equatable.dart';

import 'name.dart';
import 'profile_picture.dart';

class Teacher extends Equatable {
  final String? id;
  final String? userId;
  final Name? name;
  final String? email;
  final String? role;
  final String? gender;
  final String? department;
  final ProfilePicture? profilePicture;

  const Teacher({
    this.id,
    this.userId,
    this.name,
    this.email,
    this.role,
    this.gender,
    this.department,
    this.profilePicture,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        id: json['_id'] as String?,
        userId: json['userId'] as String?,
        name: json['name'] == null
            ? null
            : Name.fromJson(json['name'] as Map<String, dynamic>),
        email: json['email'] as String?,
        role: json['role'] as String?,
        gender: json['gender'] as String?,
        department: json['department'] as String?,
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
        'department': department,
        'profilePicture': profilePicture?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      name,
      email,
      role,
      gender,
      department,
      profilePicture,
    ];
  }
}
