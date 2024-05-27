import 'package:equatable/equatable.dart';

import 'post_comment.dart';

class Comments extends Equatable {
  final String? message;
  final List<PostComment>? postComments;

  const Comments({this.message, this.postComments});

  factory Comments.fromJson(Map<String, dynamic> json) => Comments(
        message: json['message'] as String?,
        postComments: (json['postComments'] as List<dynamic>?)
            ?.map((e) => PostComment.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'postComments': postComments?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [message, postComments];
}
