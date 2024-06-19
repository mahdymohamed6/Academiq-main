import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final String? id;
  final String? courseId;
  final String? title;
  final String? department;

  const Course({this.id, this.courseId, this.title, this.department});

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json['_id'] as String?,
        courseId: json['courseId'] as String?,
        title: json['title'] as String?,
        department: json['department'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'courseId': courseId,
        'title': title,
        'department': department,
      };

  @override
  List<Object?> get props => [id, courseId, title, department];
}
