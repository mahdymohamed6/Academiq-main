import 'sender.dart';

class NotificationModel {
  Sender? sender;
  String? id;
  String? title;
  String? message;
  bool? isAnnouncement;
  DateTime? date;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  NotificationModel({
    this.sender,
    this.id,
    this.title,
    this.message,
    this.isAnnouncement,
    this.date,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      sender: json['sender'] == null
          ? null
          : Sender.fromJson(json['sender'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      title: json['title'] as String?,
      message: json['message'] as String?,
      isAnnouncement: json['isAnnouncement'] as bool?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'sender': sender?.toJson(),
        '_id': id,
        'title': title,
        'message': message,
        'isAnnouncement': isAnnouncement,
        'date': date?.toIso8601String(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
