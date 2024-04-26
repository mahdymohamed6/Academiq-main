import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final String? street;
  final String? city;
  final String? state;

  const AddressEntity({this.street, this.city, this.state});

  @override
  List<Object?> get props => [street, city, state];
}
