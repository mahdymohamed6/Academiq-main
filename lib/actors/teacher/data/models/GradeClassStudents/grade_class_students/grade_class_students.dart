import 'package:equatable/equatable.dart';

import 'student.dart';

class GradeClassStudents extends Equatable {
  final String? message;
  final List<Student>? students;

  const GradeClassStudents({this.message, this.students});

  factory GradeClassStudents.fromJson(Map<String, dynamic> json) {
    return GradeClassStudents(
      message: json['message'] as String?,
      students: (json['students'] as List<dynamic>?)
          ?.map((e) => Student.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'students': students?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [message, students];
}
