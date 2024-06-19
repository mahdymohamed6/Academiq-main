import 'package:equatable/equatable.dart';
import 'package:necessities/actors/teacher/data/models/GradeClassStudents/grade_class_students/name.dart';

class StudentDetail extends Equatable {
  final Name? name;

  final String? id;
  final String? username;
  final String? email;

  const StudentDetail({
    this.name,
    this.id,
    this.username,
    this.email,
  });

  factory StudentDetail.fromJson(Map<String, dynamic> json) => StudentDetail(
        name: json['name'] == null
            ? null
            : Name.fromJson(json['name'] as Map<String, dynamic>),
        id: json['_id'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name?.toJson(),
        '_id': id,
        'username': username,
        'email': email,
      };

  @override
  List<Object?> get props {
    return [
      name,
      id,
      username,
      email,
    ];
  }
}
