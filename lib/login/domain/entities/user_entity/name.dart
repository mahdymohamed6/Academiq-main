import 'package:equatable/equatable.dart';

class NameEntity extends Equatable {
  final String? first;
  final String? last;

  const NameEntity({this.first, this.last});

 
  @override
  List<Object?> get props => [first, last];
}
