import 'package:equatable/equatable.dart';

class Name extends Equatable {
  final String? first;
  final String? last;

  const Name({this.first, this.last});

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        first: json['first'] as String?,
        last: json['last'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'first': first,
        'last': last,
      };

  @override
  List<Object?> get props => [first, last];
}
