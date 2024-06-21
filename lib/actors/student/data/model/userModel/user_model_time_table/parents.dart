import 'package:equatable/equatable.dart';

import 'father.dart';

class Parents extends Equatable {
  final dynamic motherId;
  final Father? father;

  const Parents({this.motherId, this.father});

  factory Parents.fromJson(Map<String, dynamic> json) => Parents(
        motherId: json['motherId'] as dynamic,
        father: json['father'] == null
            ? null
            : Father.fromJson(json['father'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'motherId': motherId,
        'father': father?.toJson(),
      };

  @override
  List<Object?> get props => [motherId, father];
}
