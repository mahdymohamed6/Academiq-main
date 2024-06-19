import 'package:equatable/equatable.dart';

import 'course.dart';

class OneCourse extends Equatable {
  final String? message;
  final Course? course;

  const OneCourse({this.message, this.course});

  factory OneCourse.fromJson(Map<String, dynamic> json) => OneCourse(
        message: json['message'] as String?,
        course: json['course'] == null
            ? null
            : Course.fromJson(json['course'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'course': course?.toJson(),
      };

  @override
  List<Object?> get props => [message, course];
}
