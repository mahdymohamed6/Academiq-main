import 'package:equatable/equatable.dart';
import 'package:necessities/login/domain/entities/user_entity/user.dart';
import 'package:necessities/login/domain/entities/user_entity/user_Entity.dart';

import 'contact_information.dart';
import 'name.dart';
import 'parents.dart';

class User extends UserEntity {
  final Name? name;
  final ContactInformation? contactInformation;
  final Parents? parents;
  final String? id;
  final String? userId;
  final String? username;
  final String? email;
  final String? ssn;
  final DateTime? birthdate;
  final String? gender;
  final String? role;
  final List<dynamic>? courses;
  final List<dynamic>? children;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? gradeClassId;

  const User({
    this.name,
    this.contactInformation,
    this.parents,
    this.id,
    this.userId,
    this.username,
    this.email,
    this.ssn,
    this.birthdate,
    this.gender,
    this.role,
    this.courses,
    this.children,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.gradeClassId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'] == null
            ? null
            : Name.fromJson(json['name'] as Map<String, dynamic>),
        contactInformation: json['contactInformation'] == null
            ? null
            : ContactInformation.fromJson(
                json['contactInformation'] as Map<String, dynamic>),
        parents: json['parents'] == null
            ? null
            : Parents.fromJson(json['parents'] as Map<String, dynamic>),
        id: json['_id'] as String?,
        userId: json['userId'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        ssn: json['ssn'] as String?,
        birthdate: json['birthdate'] == null
            ? null
            : DateTime.parse(json['birthdate'] as String),
        gender: json['gender'] as String?,
        role: json['role'] as String?,
        courses: json['courses'] as List<dynamic>?,
        children: json['children'] as List<dynamic>?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        gradeClassId: json['gradeClassId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name?.toJson(),
        'contactInformation': contactInformation?.toJson(),
        'parents': parents?.toJson(),
        '_id': id,
        'userId': userId,
        'username': username,
        'email': email,
        'ssn': ssn,
        'birthdate': birthdate?.toIso8601String(),
        'gender': gender,
        'role': role,
        'courses': courses,
        'children': children,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'gradeClassId': gradeClassId,
      };

  @override
  List<Object?> get props {
    return [
      name,
      contactInformation,
      parents,
      id,
      userId,
      username,
      email,
      ssn,
      birthdate,
      gender,
      role,
      courses,
      children,
      createdAt,
      updatedAt,
      v,
      gradeClassId,
    ];
  }
}
