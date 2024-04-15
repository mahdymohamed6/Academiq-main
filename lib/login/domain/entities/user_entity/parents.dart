import 'package:equatable/equatable.dart';

class ParentsEntity extends Equatable {
  final dynamic motherId;
  final dynamic fatherId;

  const ParentsEntity({this.motherId, this.fatherId});

  @override
  List<Object?> get props => [motherId, fatherId];
}
