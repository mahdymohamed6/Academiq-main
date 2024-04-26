// ignore_for_file: overridden_fields, annotate_overrides

import 'package:necessities/actors/student/features/Home/domain/entitiy/child_entity.dart';

import 'contact_information.model.dart';
import 'name.model.dart';
import 'parents.model.dart';

class UserChildModel extends ChildEntity {
  Name? name;
  ContactInformation? contactInformation;
  Parents? parents;
  @override
  String? id;
  String? userId;
  String? username;
  String? email;
  String? ssn;
  DateTime? birthdate;
  String? gender;
  String? role;
  List<dynamic>? courses;
  List<dynamic>? children;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? gradeClassId;
  int? points;

  UserChildModel({
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
    this.points,
  }) : super(
            id: id,
            fristName: name!.first!,
            secondtName: name.last!,
            motherId: parents?.motherId,
            fatherId: parents?.fatherId,
            userName: username!,
            userId: userId);

  factory UserChildModel.fromJson(Map<String, dynamic> json) => UserChildModel(
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
        points: json['points'] as int?,
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
        'points': points,
      };
}
