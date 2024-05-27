import 'package:equatable/equatable.dart';

import 'creator.dart';

class Creator extends Equatable {
  final Creator? creator;
  final bool? isLiked;

  const Creator({this.creator, this.isLiked});

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        creator: json['creator'] == null
            ? null
            : Creator.fromJson(json['creator'] as Map<String, dynamic>),
        isLiked: json['isLiked'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'creator': creator?.toJson(),
        'isLiked': isLiked,
      };

  @override
  List<Object?> get props => [creator, isLiked];
}
