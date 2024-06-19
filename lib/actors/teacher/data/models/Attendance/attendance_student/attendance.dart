import 'package:equatable/equatable.dart';
import 'package:necessities/actors/teacher/data/models/Attendance/attendance_student/students.dart';

import 'schedule.dart';

class Attendance extends Equatable {
  final Schedule? schedule;
  final String? id;
  final String? courseId;
  final String? gradeClassId;
  final String? teacherId;
  final List<Students>? students;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const Attendance({
    this.schedule,
    this.id,
    this.courseId,
    this.gradeClassId,
    this.teacherId,
    this.students,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        schedule: json['schedule'] == null
            ? null
            : Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
        id: json['_id'] as String?,
        courseId: json['courseId'] as String?,
        gradeClassId: json['gradeClassId'] as String?,
        teacherId: json['teacherId'] as String?,
        students: (json['students'] as List<dynamic>?)
            ?.map((e) => Students.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'schedule': schedule?.toJson(),
        '_id': id,
        'courseId': courseId,
        'gradeClassId': gradeClassId,
        'teacherId': teacherId,
        'students': students?.map((e) => e.toJson()).toList(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };

  @override
  List<Object?> get props {
    return [
      schedule,
      id,
      courseId,
      gradeClassId,
      teacherId,
      students,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
