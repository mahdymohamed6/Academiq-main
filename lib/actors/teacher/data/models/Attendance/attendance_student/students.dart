import 'package:equatable/equatable.dart';
import 'package:necessities/actors/student/features/Home/presentation/widgets/student_details.dart';
import 'package:necessities/actors/teacher/data/models/Attendance/attendance_student/studentDetails.dart';

class Students extends Equatable {
  final StudentDetail? student;
  final String? status;
  final String? id;

  const Students({this.student, this.status, this.id});

  factory Students.fromJson(Map<String, dynamic> json) => Students(
        student: json['student'] == null
            ? null
            : StudentDetail.fromJson(json['student'] as Map<String, dynamic>),
        status: json['status'] as String?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'student': student?.toJson(),
        'status': status,
        '_id': id,
      };

  @override
  List<Object?> get props => [student, status, id];
}
