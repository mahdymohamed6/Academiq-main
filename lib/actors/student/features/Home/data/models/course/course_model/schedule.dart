class Schedule {
  DateTime? startDate;
  DateTime? endDate;

  Schedule({this.startDate, this.endDate});

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        startDate: json['startDate'] == null
            ? null
            : DateTime.parse(json['startDate'] as String),
        endDate: json['endDate'] == null
            ? null
            : DateTime.parse(json['endDate'] as String),
      );

  Map<String, dynamic> toJson() => {
        'startDate': startDate?.toIso8601String(),
        'endDate': endDate?.toIso8601String(),
      };
}
