import 'contact_information.dart';
import 'course.dart';
import 'name.dart';
import 'parents.dart';
import 'profile_picture.dart';

class User {
  Name? name;
  ProfilePicture? profilePicture;
  ContactInformation? contactInformation;
  Parents? parents;
  String? id;
  String? userId;
  String? username;
  String? email;
  String? ssn;
  DateTime? birthdate;
  String? gender;
  String? role;
  List<Course>? courses;
  List<dynamic>? children;
  DateTime? createdAt;

  User({
    this.name,
    this.profilePicture,
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
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'] == null
            ? null
            : Name.fromJson(json['name'] as Map<String, dynamic>),
        profilePicture: json['profilePicture'] == null
            ? null
            : ProfilePicture.fromJson(
                json['profilePicture'] as Map<String, dynamic>),
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
        courses: (json['courses'] as List<dynamic>?)
            ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
            .toList(),
        children: json['children'] as List<dynamic>?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'name': name?.toJson(),
        'profilePicture': profilePicture?.toJson(),
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
        'courses': courses?.map((e) => e.toJson()).toList(),
        'children': children,
        'createdAt': createdAt?.toIso8601String(),
      };
}
