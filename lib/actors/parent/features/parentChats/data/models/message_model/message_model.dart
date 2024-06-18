import 'package:necessities/actors/parent/features/parentChats/data/message_entity.dart';

import 'sender.dart';

class MessageModel extends MessageEntity {
  Sender? sender;
  String? id;
  String? chatId;
  String? content;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  MessageModel({
    this.sender,
    this.id,
    this.chatId,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.v,
  }) : super(message: content!, userId: sender!.id!);

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        sender: json['sender'] == null
            ? null
            : Sender.fromJson(json['sender'] as Map<String, dynamic>),
        id: json['_id'] as String?,
        chatId: json['chatId'] as String?,
        content: json['content'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'sender': sender?.toJson(),
        '_id': id,
        'chatId': chatId,
        'content': content,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
