import 'member.dart';

class ChatDetailsModel {
  String? id;
  String? type;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? image;
  Member? member;
  List<dynamic>? lastMessage;

  ChatDetailsModel({
    this.id,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.image,
    this.member,
    this.lastMessage,
  });

  factory ChatDetailsModel.fromJson(Map<String, dynamic> json) {
    return ChatDetailsModel(
      id: json['_id'] as String?,
      type: json['type'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      image: json['image'] as String?,
      member: json['member'] == null
          ? null
          : Member.fromJson(json['member'] as Map<String, dynamic>),
      lastMessage: json['lastMessage'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'type': type,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'image': image,
        'member': member?.toJson(),
        'lastMessage': lastMessage,
      };
}
