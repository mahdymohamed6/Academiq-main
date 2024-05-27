import 'package:equatable/equatable.dart';

import 'creator.dart';

class Post extends Equatable {
  final String? content;
  final List<dynamic>? attachments;
  final List<dynamic>? likes;
  final List<dynamic>? comments;
  final String? discussionId;
  final bool? isAnnouncement;
  final bool? isEdited;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final Creator? creator;
  final bool? isLiked;

  const Post({
    this.content,
    this.attachments,
    this.likes,
    this.comments,
    this.discussionId,
    this.isAnnouncement,
    this.isEdited,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.creator,
    this.isLiked,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        content: json['content'] as String?,
        attachments: json['attachments'] as List<dynamic>?,
        likes: json['likes'] as List<dynamic>?,
        comments: json['comments'] as List<dynamic>?,
        discussionId: json['discussionId'] as String?,
        isAnnouncement: json['isAnnouncement'] as bool?,
        isEdited: json['isEdited'] as bool?,
        id: json['_id'] as String?,
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
        isLiked: json['isLiked'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'content': content,
        'attachments': attachments,
        'likes': likes,
        'comments': comments,
        'discussionId': discussionId,
        'isAnnouncement': isAnnouncement,
        'isEdited': isEdited,
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'creator': creator?.toJson(),
        'isLiked': isLiked,
      };

  @override
  List<Object?> get props {
    return [
      content,
      attachments,
      likes,
      comments,
      discussionId,
      isAnnouncement,
      isEdited,
      id,
      createdAt,
      updatedAt,
      v,
      creator,
      isLiked,
    ];
  }
}
