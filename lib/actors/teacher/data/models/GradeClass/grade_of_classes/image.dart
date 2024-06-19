import 'package:equatable/equatable.dart';

class Image extends Equatable {
  final String? color;

  const Image({this.color});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        color: json['color'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'color': color,
      };

  @override
  List<Object?> get props => [color];
}
