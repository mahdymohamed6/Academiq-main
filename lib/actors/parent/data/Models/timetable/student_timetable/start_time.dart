import 'package:equatable/equatable.dart';

class StartTime extends Equatable {
  final int? hour;
  final int? minute;

  const StartTime({this.hour, this.minute});

  factory StartTime.fromJson(Map<String, dynamic> json) => StartTime(
        hour: json['hour'] as int?,
        minute: json['minute'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'hour': hour,
        'minute': minute,
      };

  @override
  List<Object?> get props => [hour, minute];
}
