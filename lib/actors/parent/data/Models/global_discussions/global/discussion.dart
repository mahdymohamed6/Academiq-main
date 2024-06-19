import 'package:equatable/equatable.dart';

import 'post.dart';

class Discussion extends Equatable {
  final String? id;
  final bool? isGlobal;
  final List<Post>? posts;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const Discussion({
    this.id,
    this.isGlobal,
    this.posts,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Discussion.fromJson(Map<String, dynamic> json) => Discussion(
        id: json['_id'] as String?,
        isGlobal: json['isGlobal'] as bool?,
        posts: (json['posts'] as List<dynamic>?)
            ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'isGlobal': isGlobal,
        'posts': posts?.map((e) => e.toJson()).toList(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };

  @override
  List<Object?> get props {
    return [
      id,
      isGlobal,
      posts,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
