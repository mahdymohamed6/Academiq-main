import 'name.dart';

class Sender {
  Name? name;
  String? id;
  String? username;
  String? email;
  String? role;

  Sender({this.name, this.id, this.username, this.email, this.role});

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
        name: json['name'] == null
            ? null
            : Name.fromJson(json['name'] as Map<String, dynamic>),
        id: json['_id'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        role: json['role'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name?.toJson(),
        '_id': id,
        'username': username,
        'email': email,
        'role': role,
      };
}
