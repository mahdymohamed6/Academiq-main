import 'from.dart';
import 'to.dart';

class ReportModel {
  String? id;
  String? subject;
  String? body;
  List<dynamic>? attachments;
  To? to;
  From? from;
  String? priority;
  bool? isSeen;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? reply;

  ReportModel({
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

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
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
}
