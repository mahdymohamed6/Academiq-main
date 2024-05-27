import 'package:equatable/equatable.dart';

import 'post.dart';

class OnePost extends Equatable {
  final String? message;
  final Post? post;

  const OnePost({this.message, this.post});

  factory OnePost.fromJson(Map<String, dynamic> json) => OnePost(
        message: json['message'] as String?,
        post: json['post'] == null
            ? null
            : Post.fromJson(json['post'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'post': post?.toJson(),
      };

  @override
  List<Object?> get props => [message, post];
}
