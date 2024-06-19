import 'package:equatable/equatable.dart';

class GradeClass extends Equatable {
  final String? id;
  final String? gradeClassId;
  final int? level;
  final String? letter;
  final String? room;

  const GradeClass({
    this.id,
    this.gradeClassId,
    this.level,
    this.letter,
    this.room,
  });

  factory GradeClass.fromJson(Map<String, dynamic> json) => GradeClass(
        id: json['_id'] as String?,
        gradeClassId: json['gradeClassId'] as String?,
        level: json['level'] as int?,
        letter: json['letter'] as String?,
        room: json['room'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'gradeClassId': gradeClassId,
        'level': level,
        'letter': letter,
        'room': room,
      };

  @override
  List<Object?> get props => [id, gradeClassId, level, letter, room];
}
