import 'package:equatable/equatable.dart';

import 'report.dart';

class Reports extends Equatable {
  final String? message;
  final List<Report>? reports;

  const Reports({this.message, this.reports});

  factory Reports.fromJson(Map<String, dynamic> json) => Reports(
        message: json['message'] as String?,
        reports: (json['reports'] as List<dynamic>?)
            ?.map((e) => Report.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'reports': reports?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [message, reports];
}
