import 'package:equatable/equatable.dart';

class GradeClass extends Equatable {
  final String? gradeClassId;
  final int? gradeLevel;

  const GradeClass({this.gradeClassId, this.gradeLevel});

  factory GradeClass.fromJson(Map<String, dynamic> json) => GradeClass(
        gradeClassId: json['gradeClassId'] as String?,
        gradeLevel: json['gradeLevel'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'gradeClassId': gradeClassId,
        'gradeLevel': gradeLevel,
      };

  @override
  List<Object?> get props => [gradeClassId, gradeLevel];
}
