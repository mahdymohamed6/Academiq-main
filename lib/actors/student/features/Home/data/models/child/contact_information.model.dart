import 'address.model.dart';

class ContactInformation {
  Address? address;
  String? phone;

  ContactInformation({this.address, this.phone});

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
}
