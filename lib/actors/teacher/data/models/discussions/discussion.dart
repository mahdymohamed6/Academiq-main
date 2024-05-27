import 'package:equatable/equatable.dart';

import 'post.dart';

class Discussion extends Equatable {
  final String? id;
  final String? courseId;
  final bool? isGlobal;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final List<Post>? posts;

  const Discussion({
    this.id,
    this.courseId,
    this.isGlobal,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.posts,
  });

  factory Discussion.fromJson(Map<String, dynamic> json) => Discussion(
        id: json['_id'] as String?,
        courseId: json['courseId'] as String?,
        isGlobal: json['isGlobal'] as bool?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        posts: (json['posts'] as List<dynamic>?)
            ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'courseId': courseId,
        'isGlobal': isGlobal,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'posts': posts?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      courseId,
      isGlobal,
      createdAt,
      updatedAt,
      v,
      posts,
    ];
  }
}
