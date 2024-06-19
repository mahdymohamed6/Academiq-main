import 'package:equatable/equatable.dart';

class Parents extends Equatable {
  final dynamic motherId;
  final String? fatherId;

  const Parents({this.motherId, this.fatherId});

  factory Parents.fromJson(Map<String, dynamic> json) => Parents(
        motherId: json['motherId'] as dynamic,
        fatherId: json['fatherId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'motherId': motherId,
        'fatherId': fatherId,
      };

  @override
  List<Object?> get props => [motherId, fatherId];
}
