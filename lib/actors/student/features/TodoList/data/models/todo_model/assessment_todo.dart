import 'package:equatable/equatable.dart';

import 'assessment_schedule.dart';

class AssessmentTodo extends Equatable {
  final String? studentId;
  final String? title;
  final String? description;
  final DateTime? schedule;
  final AssessmentSchedule? assessmentSchedule;

  const AssessmentTodo({
    this.studentId,
    this.title,
    this.description,
    this.schedule,
    this.assessmentSchedule,
  });

  factory AssessmentTodo.fromJson(Map<String, dynamic> json) {
    return AssessmentTodo(
      studentId: json['studentId'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      schedule: json['schedule'] == null
          ? null
          : DateTime.parse(json['schedule'] as String),
      assessmentSchedule: json['assessmentSchedule'] == null
          ? null
          : AssessmentSchedule.fromJson(
              json['assessmentSchedule'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'studentId': studentId,
        'title': title,
        'description': description,
        'schedule': schedule?.toIso8601String(),
        'assessmentSchedule': assessmentSchedule?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      studentId,
      title,
      description,
      schedule,
      assessmentSchedule,
    ];
  }
}
