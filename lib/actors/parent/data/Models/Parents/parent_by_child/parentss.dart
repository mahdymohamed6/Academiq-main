import 'package:equatable/equatable.dart';

import 'father.dart';

class Parents extends Equatable {
  final dynamic mother;
  final Father? father;

  const Parents({this.mother, this.father});

  factory Parents.fromJson(Map<String, dynamic> json) => Parents(
        mother: json['mother'] as dynamic,
        father: json['father'] == null
            ? null
            : Father.fromJson(json['father'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'mother': mother,
        'father': father?.toJson(),
      };

  @override
  List<Object?> get props => [mother, father];
}
