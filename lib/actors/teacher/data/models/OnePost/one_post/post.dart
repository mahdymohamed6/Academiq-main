import 'package:equatable/equatable.dart';

import 'creator.dart';

class Post extends Equatable {
  final String? id;
  final String? content;
  final List<dynamic>? likes;
  final List<dynamic>? comments;
  final String? discussionId;
  final bool? isAnnouncement;
  final bool? isEdited;
  final DateTime? createdAt;

  final DateTime? updatedAt;
  final int? v;
  final List<dynamic>? attachments;
  final Creator? creator;

  const Post({
    this.id,
    this.content,
    this.likes,
    this.comments,
    this.discussionId,
    this.isAnnouncement,
    this.isEdited,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.attachments,
    this.creator,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json['_id'] as String?,
        content: json['content'] as String?,
        likes: json['likes'] as List<dynamic>?,
        comments: json['comments'] as List<dynamic>?,
        discussionId: json['discussionId'] as String?,
        isAnnouncement: json['isAnnouncement'] as bool?,
        isEdited: json['isEdited'] as bool?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        attachments: json['attachments'] as List<dynamic>?,
        creator: json['creator'] == null
            ? null
            : Creator.fromJson(json['creator'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'content': content,
        'likes': likes,
        'comments': comments,
        'discussionId': discussionId,
        'isAnnouncement': isAnnouncement,
        'isEdited': isEdited,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'attachments': attachments,
        'creator': creator?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      content,
      likes,
      comments,
      discussionId,
      isAnnouncement,
      isEdited,
      createdAt,
      updatedAt,
      v,
      attachments,
      creator,
    ];
  }
}
