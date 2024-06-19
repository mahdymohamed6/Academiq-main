import 'package:equatable/equatable.dart';

import 'grade_class.dart';

class GradeOfClasses extends Equatable {
  final String? message;
  final List<GradeClass>? gradeClasses;

  const GradeOfClasses({this.message, this.gradeClasses});

  factory GradeOfClasses.fromJson(Map<String, dynamic> json) {
    return GradeOfClasses(
      message: json['message'] as String?,
      gradeClasses: (json['gradeClasses'] as List<dynamic>?)
          ?.map((e) => GradeClass.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'gradeClasses': gradeClasses?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [message, gradeClasses];
}
