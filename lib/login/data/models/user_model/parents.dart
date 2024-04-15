import 'package:equatable/equatable.dart';
import 'package:necessities/login/domain/entities/user_entity/parents.dart';

class Parents extends ParentsEntity {
  final dynamic motherId;
  final dynamic fatherId;

  const Parents({this.motherId, this.fatherId});

  factory Parents.fromJson(Map<String, dynamic> json) => Parents(
        motherId: json['motherId'] as dynamic,
        fatherId: json['fatherId'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'motherId': motherId,
        'fatherId': fatherId,
      };

  @override
  List<Object?> get props => [motherId, fatherId];
}
