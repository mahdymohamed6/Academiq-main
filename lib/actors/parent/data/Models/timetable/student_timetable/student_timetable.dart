import 'package:equatable/equatable.dart';

import 'timetable.dart';

class StudentTimetable extends Equatable {
  final String? message;
  final List<Timetable>? timetable;

  const StudentTimetable({this.message, this.timetable});

  factory StudentTimetable.fromJson(Map<String, dynamic> json) {
    return StudentTimetable(
      message: json['message'] as String?,
      timetable: (json['timetable'] as List<dynamic>?)
          ?.map((e) => Timetable.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'timetable': timetable?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [message, timetable];
}
