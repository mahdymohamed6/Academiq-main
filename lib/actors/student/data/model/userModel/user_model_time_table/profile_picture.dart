import 'package:equatable/equatable.dart';

class ProfilePicture extends Equatable {
  final String? color;

  const ProfilePicture({this.color});

  factory ProfilePicture.fromJson(Map<String, dynamic> json) {
    return ProfilePicture(
      color: json['color'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'color': color,
      };

  @override
  List<Object?> get props => [color];
}
