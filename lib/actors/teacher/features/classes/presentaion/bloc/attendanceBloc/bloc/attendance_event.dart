part of 'attendance_bloc.dart';

sealed class AttendanceEvent extends Equatable {
  const AttendanceEvent();

  @override
  List<Object> get props => [];
}

class getAttendance extends AttendanceEvent {
  final String gradeClassId;
  final String date;
  final int period;

  getAttendance({
    required this.gradeClassId,
    required this.date,
    required this.period,
  });

  @override
  List<Object> get props => [gradeClassId, date, period];
}
