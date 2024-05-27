import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String? id;
  final String? studentId;
  final String? title;
  final String? description;
  final bool? completed;
  final DateTime? schedule;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const Todo({
    this.id,
    this.studentId,
    this.title,
    this.description,
    this.completed,
    this.schedule,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json['_id'] as String?,
        studentId: json['studentId'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        completed: json['completed'] as bool?,
        schedule: json['schedule'] == null
            ? null
            : DateTime.parse(json['schedule'] as String),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'studentId': studentId,
        'title': title,
        'description': description,
        'completed': completed,
        'schedule': schedule?.toIso8601String(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };

  @override
  List<Object?> get props {
    return [
      id,
      studentId,
      title,
      description,
      completed,
      schedule,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
