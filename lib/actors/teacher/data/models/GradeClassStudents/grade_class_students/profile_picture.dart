import 'package:equatable/equatable.dart';

class ProfilePicture extends Equatable {
  final dynamic name;
  final String? color;

  const ProfilePicture({this.name, this.color});

  factory ProfilePicture.fromJson(Map<String, dynamic> json) {
    return ProfilePicture(
      name: json['name'] as dynamic,
      color: json['color'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'color': color,
      };

  @override
  List<Object?> get props => [name, color];
}
