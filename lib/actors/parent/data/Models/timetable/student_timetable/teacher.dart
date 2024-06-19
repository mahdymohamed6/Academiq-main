import 'package:equatable/equatable.dart';

import 'name.dart';

class Teacher extends Equatable {
  final String? id;
  final String? userId;
  final Name? name;
  final String? email;

  const Teacher({this.id, this.userId, this.name, this.email});

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        id: json['_id'] as String?,
        userId: json['userId'] as String?,
        name: json['name'] == null
            ? null
            : Name.fromJson(json['name'] as Map<String, dynamic>),
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userId': userId,
        'name': name?.toJson(),
        'email': email,
      };

  @override
  List<Object?> get props => [id, userId, name, email];
}
