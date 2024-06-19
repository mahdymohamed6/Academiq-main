import 'package:equatable/equatable.dart';

class ProfilePicture extends Equatable {
  final String? color;
  final String? url;

  const ProfilePicture({this.color, this.url});

  factory ProfilePicture.fromJson(Map<String, dynamic> json) {
    return ProfilePicture(
      color: json['color'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'color': color,
        'url': url,
      };

  @override
  List<Object?> get props => [color, url];
}
