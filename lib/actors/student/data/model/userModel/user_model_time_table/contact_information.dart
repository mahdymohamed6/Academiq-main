import 'package:equatable/equatable.dart';

import 'address.dart';

class ContactInformation extends Equatable {
  final Address? address;
  final String? phone;

  const ContactInformation({this.address, this.phone});

  factory ContactInformation.fromJson(Map<String, dynamic> json) {
    return ContactInformation(
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      phone: json['phone'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'address': address?.toJson(),
        'phone': phone,
      };

  @override
  List<Object?> get props => [address, phone];
}
