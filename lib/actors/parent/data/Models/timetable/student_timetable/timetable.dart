import 'package:equatable/equatable.dart';

import 'course.dart';
import 'end_time.dart';
import 'grade_class.dart';
import 'start_time.dart';
import 'teacher.dart';

class Timetable extends Equatable {
  final String? id;
  final String? day;
  final int? period;
  final Course? course;
  final Teacher? teacher;
  final GradeClass? gradeClass;
  final StartTime? startTime;
  final EndTime? endTime;

  const Timetable({
    this.id,
    this.day,
    this.period,
    this.course,
    this.teacher,
    this.gradeClass,
    this.startTime,
    this.endTime,
  });

  factory Timetable.fromJson(Map<String, dynamic> json) => Timetable(
        id: json['_id'] as String?,
        day: json['day'] as String?,
        period: json['period'] as int?,
        course: json['course'] == null
            ? null
            : Course.fromJson(json['course'] as Map<String, dynamic>),
        teacher: json['teacher'] == null
            ? null
            : Teacher.fromJson(json['teacher'] as Map<String, dynamic>),
        gradeClass: json['gradeClass'] == null
            ? null
            : GradeClass.fromJson(json['gradeClass'] as Map<String, dynamic>),
        startTime: json['startTime'] == null
            ? null
            : StartTime.fromJson(json['startTime'] as Map<String, dynamic>),
        endTime: json['endTime'] == null
            ? null
            : EndTime.fromJson(json['endTime'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'day': day,
        'period': period,
        'course': course?.toJson(),
        'teacher': teacher?.toJson(),
        'gradeClass': gradeClass?.toJson(),
        'startTime': startTime?.toJson(),
        'endTime': endTime?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      day,
      period,
      course,
      teacher,
      gradeClass,
      startTime,
      endTime,
    ];
  }
}
