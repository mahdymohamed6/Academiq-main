import 'package:necessities/actors/parent/features/parentChats/data/message_entity.dart';

import 'sender.dart';

class SocketMessageModel extends MessageEntity {
  String? chatId;
  String? content;
  Sender? sender;
  DateTime? createdAt;

  SocketMessageModel({
    this.chatId,
    this.content,
    this.sender,
    this.createdAt,
  }) : super(message: content!, userId: sender!.id!);

  factory SocketMessageModel.fromJson(Map<String, dynamic> json) {
    return SocketMessageModel(
      chatId: json['chatId'] as String?,
      content: json['content'] as String?,
      sender: json['sender'] == null
          ? null
          : Sender.fromJson(json['sender'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'chatId': chatId,
        'content': content,
        'sender': sender?.toJson(),
        'createdAt': createdAt?.toIso8601String(),
      };
}
