import 'package:equatable/equatable.dart';

import 'address.dart';

class ContactInformationEntity extends Equatable {
  final AddressEntity? address;
  final String? phone;

  const ContactInformationEntity({this.address, this.phone});

  @override
  List<Object?> get props => [address, phone];
}
