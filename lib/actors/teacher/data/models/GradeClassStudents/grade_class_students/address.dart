import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String? street;
  final String? city;
  final String? state;

  const Address({this.street, this.city, this.state});

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json['street'] as String?,
        city: json['city'] as String?,
        state: json['state'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'street': street,
        'city': city,
        'state': state,
      };

  @override
  List<Object?> get props => [street, city, state];
}
