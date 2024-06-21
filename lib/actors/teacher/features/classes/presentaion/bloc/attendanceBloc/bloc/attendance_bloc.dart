import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:necessities/actors/teacher/data/data_source/data_source.dart';
import 'package:necessities/actors/teacher/data/models/Attendance/attendance_student/attendance.dart';

part 'attendance_event.dart';
part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  AttendanceBloc() : super(AttendanceInitial()) {
    on<getAttendance>(_getTodo);
  }

  FutureOr<void> _getTodo(
      getAttendance event, Emitter<AttendanceState> emit) async {
    emit(AttendanceLoading());
    try {
      final data = await DiscussionService().getAttendance(
        id: event.gradeClassId,
        date: event.date,
        period: event.period,
      );
      if (data.attendance != null) {
        emit(AttendanceSuccess(attendance: data.attendance!));
      } else {
        emit(AttendanceFailure(
            message: 'Attendance data is null or has no students'));
      }
    } catch (e) {
      emit(AttendanceFailure(message: 'Error loading attendance: $e'));
    }
  }
}
