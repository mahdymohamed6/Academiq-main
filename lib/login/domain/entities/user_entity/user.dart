import 'package:equatable/equatable.dart';

import 'contact_information.dart';
import 'name.dart';
import 'parents.dart';

class UserEntity extends Equatable {
  final NameEntity? name;
  final ContactInformationEntity? contactInformation;
  final ParentsEntity? parents;
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

  const UserEntity({
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
