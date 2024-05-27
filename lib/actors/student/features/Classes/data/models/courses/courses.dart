import 'package:equatable/equatable.dart';

import 'course.dart';

class Courses extends Equatable {
  final String? message;
  final List<Course>? courses;

  const Courses({this.message, this.courses});

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
        message: json['message'] as String?,
        courses: (json['courses'] as List<dynamic>?)
            ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'courses': courses?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [message, courses];
}
