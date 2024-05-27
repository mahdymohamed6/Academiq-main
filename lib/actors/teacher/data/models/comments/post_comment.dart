import 'package:equatable/equatable.dart';

import 'creator.dart';

class PostComment extends Equatable {
  final String? id;
  final String? content;
  final String? attachment;
  final String? postId;
  final bool? isEdited;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final Creator? creator;

  const PostComment({
    this.id,
    this.content,
    this.attachment,
    this.postId,
    this.isEdited,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.creator,
  });

  factory PostComment.fromJson(Map<String, dynamic> json) => PostComment(
        id: json['_id'] as String?,
        content: json['content'] as String?,
        attachment: json['attachment'] as String?,
        postId: json['postId'] as String?,
        isEdited: json['isEdited'] as bool?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        creator: json['creator'] == null
            ? null
            : Creator.fromJson(json['creator'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'content': content,
        'attachment': attachment,
        'postId': postId,
        'isEdited': isEdited,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'creator': creator?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      content,
      attachment,
      postId,
      isEdited,
      createdAt,
      updatedAt,
      v,
      creator,
    ];
  }
}
