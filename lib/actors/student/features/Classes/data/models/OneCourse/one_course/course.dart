import 'package:equatable/equatable.dart';

import 'grade_class.dart';
import 'material.dart';
import 'schedule.dart';
import 'teacher.dart';

class Course extends Equatable {
  final GradeClass? gradeClass;
  final Schedule? schedule;
  final String? id;
  final String? courseId;
  final String? title;
  final String? department;
  final List<Teacher>? teachers;
  final List<dynamic>? assessments;
  final bool? isActive;
  final List<Material>? materials;
  final String? discussionId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? color;

  const Course({
    this.gradeClass,
    this.schedule,
    this.id,
    this.courseId,
    this.title,
    this.department,
    this.teachers,
    this.assessments,
    this.isActive,
    this.materials,
    this.discussionId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.color,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        gradeClass: json['gradeClass'] == null
            ? null
            : GradeClass.fromJson(json['gradeClass'] as Map<String, dynamic>),
        schedule: json['schedule'] == null
            ? null
            : Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
        id: json['_id'] as String?,
        courseId: json['courseId'] as String?,
        title: json['title'] as String?,
        department: json['department'] as String?,
        teachers: (json['teachers'] as List<dynamic>?)
            ?.map((e) => Teacher.fromJson(e as Map<String, dynamic>))
            .toList(),
        assessments: json['assessments'] as List<dynamic>?,
        isActive: json['isActive'] as bool?,
        materials: (json['materials'] as List<dynamic>?)
            ?.map((e) => Material.fromJson(e as Map<String, dynamic>))
            .toList(),
        discussionId: json['discussionId'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        color: json['color'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'gradeClass': gradeClass?.toJson(),
        'schedule': schedule?.toJson(),
        '_id': id,
        'courseId': courseId,
        'title': title,
        'department': department,
        'teachers': teachers?.map((e) => e.toJson()).toList(),
        'assessments': assessments,
        'isActive': isActive,
        'materials': materials?.map((e) => e.toJson()).toList(),
        'discussionId': discussionId,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'color': color,
      };

  @override
  List<Object?> get props {
    return [
      gradeClass,
      schedule,
      id,
      courseId,
      title,
      department,
      teachers,
      assessments,
      isActive,
      materials,
      discussionId,
      createdAt,
      updatedAt,
      v,
      color,
    ];
  }
}
