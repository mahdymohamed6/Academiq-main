import 'package:necessities/actors/student/features/Home/domain/entitiy/cours_entity.dart';

import 'grade_class.dart';
import 'schedule.dart';

class CourseModel {
  GradeClass? gradeClass;
  Schedule? schedule;
  String? id;
  String? courseId;
  String? title;
  String? department;
  List<dynamic>? assessments;
  bool? isActive;
  List<dynamic>? materials;
  String? discussionId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  CourseModel({
    this.gradeClass,
    this.schedule,
    this.id,
    this.courseId,
    this.title,
    this.department,
    this.assessments,
    this.isActive,
    this.materials,
    this.discussionId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
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
        assessments: json['assessments'] as List<dynamic>?,
        isActive: json['isActive'] as bool?,
        materials: json['materials'] as List<dynamic>?,
        discussionId: json['discussionId'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'gradeClass': gradeClass?.toJson(),
        'schedule': schedule?.toJson(),
        '_id': id,
        'courseId': courseId,
        'title': title,
        'department': department,
        'assessments': assessments,
        'isActive': isActive,
        'materials': materials,
        'discussionId': discussionId,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
