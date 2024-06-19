import 'package:equatable/equatable.dart';

import 'attendance.dart';

class AttendanceStudent extends Equatable {
  final String? message;
  final Attendance? attendance;

  const AttendanceStudent({this.message, this.attendance});

  factory AttendanceStudent.fromJson(Map<String, dynamic> json) {
    return AttendanceStudent(
      message: json['message'] as String?,
      attendance: json['attendance'] == null
          ? null
          : Attendance.fromJson(json['attendance'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'attendance': attendance?.toJson(),
      };

  @override
  List<Object?> get props => [message, attendance];
}
