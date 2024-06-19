import 'package:equatable/equatable.dart';

import 'parentss.dart';

class ParentByChild extends Equatable {
  final String? message;
  final Parents? parents;

  const ParentByChild({this.message, this.parents});

  factory ParentByChild.fromJson(Map<String, dynamic> json) => ParentByChild(
        message: json['message'] as String?,
        parents: json['parents'] == null
            ? null
            : Parents.fromJson(json['parents'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'parents': parents?.toJson(),
      };

  @override
  List<Object?> get props => [message, parents];
}
