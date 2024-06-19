import 'package:equatable/equatable.dart';

import 'discussion.dart';

class Global extends Equatable {
  final String? message;
  final Discussion? discussion;

  const Global({this.message, this.discussion});

  factory Global.fromJson(Map<String, dynamic> json) => Global(
        message: json['message'] as String?,
        discussion: json['discussion'] == null
            ? null
            : Discussion.fromJson(json['discussion'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'discussion': discussion?.toJson(),
      };

  @override
  List<Object?> get props => [message, discussion];
}
