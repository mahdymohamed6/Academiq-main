import 'package:equatable/equatable.dart';

import 'from.dart';
import 'to.dart';

class Report extends Equatable {
  final String? id;
  final String? subject;
  final String? body;
  final List<dynamic>? attachments;
  final To? to;
  final From? from;
  final String? priority;
  final bool? isSeen;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? reply;

  const Report({
    this.id,
    this.subject,
    this.body,
    this.attachments,
    this.to,
    this.from,
    this.priority,
    this.isSeen,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.reply,
  });

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        id: json['_id'] as String?,
        subject: json['subject'] as String?,
        body: json['body'] as String?,
        attachments: json['attachments'] as List<dynamic>?,
        to: json['to'] == null
            ? null
            : To.fromJson(json['to'] as Map<String, dynamic>),
        from: json['from'] == null
            ? null
            : From.fromJson(json['from'] as Map<String, dynamic>),
        priority: json['priority'] as String?,
        isSeen: json['isSeen'] as bool?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        reply: json['reply'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'subject': subject,
        'body': body,
        'attachments': attachments,
        'to': to?.toJson(),
        'from': from?.toJson(),
        'priority': priority,
        'isSeen': isSeen,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'reply': reply,
      };

  @override
  List<Object?> get props {
    return [
      id,
      subject,
      body,
      attachments,
      to,
      from,
      priority,
      isSeen,
      createdAt,
      updatedAt,
      v,
      reply,
    ];
  }
}
