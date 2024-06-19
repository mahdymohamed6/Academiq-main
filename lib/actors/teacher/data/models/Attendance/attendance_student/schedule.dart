import 'package:equatable/equatable.dart';

import 'end_time.dart';
import 'start_time.dart';

class Schedule extends Equatable {
  final StartTime? startTime;
  final EndTime? endTime;
  final DateTime? date;
  final String? day;
  final int? period;
  final DateTime? start;
  final DateTime? end;

  const Schedule({
    this.startTime,
    this.endTime,
    this.date,
    this.day,
    this.period,
    this.start,
    this.end,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        startTime: json['startTime'] == null
            ? null
            : StartTime.fromJson(json['startTime'] as Map<String, dynamic>),
        endTime: json['endTime'] == null
            ? null
            : EndTime.fromJson(json['endTime'] as Map<String, dynamic>),
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        day: json['day'] as String?,
        period: json['period'] as int?,
        start: json['start'] == null
            ? null
            : DateTime.parse(json['start'] as String),
        end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      );

  Map<String, dynamic> toJson() => {
        'startTime': startTime?.toJson(),
        'endTime': endTime?.toJson(),
        'date': date?.toIso8601String(),
        'day': day,
        'period': period,
        'start': start?.toIso8601String(),
        'end': end?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      startTime,
      endTime,
      date,
      day,
      period,
      start,
      end,
    ];
  }
}
