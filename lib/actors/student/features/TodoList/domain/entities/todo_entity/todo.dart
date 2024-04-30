import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final String? studentId;
  final String? title;
  final String? description;
  final bool? completed;
  final DateTime? schedule;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const TodoEntity({
    this.studentId,
    this.title,
    this.description,
    this.completed,
    this.schedule,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  @override
  List<Object?> get props {
    return [
      studentId,
      title,
      description,
      completed,
      schedule,
      id,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
