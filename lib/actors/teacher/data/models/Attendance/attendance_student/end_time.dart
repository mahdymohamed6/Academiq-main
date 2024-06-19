import 'package:equatable/equatable.dart';

class EndTime extends Equatable {
  final int? hour;
  final int? minute;

  const EndTime({this.hour, this.minute});

  factory EndTime.fromJson(Map<String, dynamic> json) => EndTime(
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
