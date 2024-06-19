import 'package:equatable/equatable.dart';

import 'child.dart';

class Childs extends Equatable {
  final String? message;
  final List<Child>? children;

  const Childs({this.message, this.children});

  factory Childs.fromJson(Map<String, dynamic> json) => Childs(
        message: json['message'] as String?,
        children: (json['children'] as List<dynamic>?)
            ?.map((e) => Child.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'children': children?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [message, children];
}
