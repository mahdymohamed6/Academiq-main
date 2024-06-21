import 'package:equatable/equatable.dart';

import 'name.dart';
import 'profile_picture.dart';

class Father extends Equatable {
  final String? id;
  final String? userId;
  final Name? name;
  final String? email;
  final String? role;
  final String? gender;
  final ProfilePicture? profilePicture;

  const Father({
    this.id,
    this.userId,
    this.name,
    this.email,
    this.role,
    this.gender,
    this.profilePicture,
  });

  factory Father.fromJson(Map<String, dynamic> json) => Father(
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

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      name,
      email,
      role,
      gender,
      profilePicture,
    ];
  }
}
