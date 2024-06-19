import 'package:equatable/equatable.dart';

import 'image.dart';

class GradeClass extends Equatable {
  final Image? image;
  final String? id;
  final String? gradeClassId;
  final int? level;
  final String? letter;
  final String? room;
  final List<dynamic>? students;
  final List<dynamic>? courses;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int? year;

  const GradeClass({
    this.image,
    this.id,
    this.gradeClassId,
    this.level,
    this.letter,
    this.room,
    this.students,
    this.courses,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.year,
  });

  factory GradeClass.fromJson(Map<String, dynamic> json) => GradeClass(
        image: json['image'] == null
            ? null
            : Image.fromJson(json['image'] as Map<String, dynamic>),
        id: json['_id'] as String?,
        gradeClassId: json['gradeClassId'] as String?,
        level: json['level'] as int?,
        letter: json['letter'] as String?,
        room: json['room'] as String?,
        students: json['students'] as List<dynamic>?,
        courses: json['courses'] as List<dynamic>?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        year: json['year'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'image': image?.toJson(),
        '_id': id,
        'gradeClassId': gradeClassId,
        'level': level,
        'letter': letter,
        'room': room,
        'students': students,
        'courses': courses,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'year': year,
      };

  @override
  List<Object?> get props {
    return [
      image,
      id,
      gradeClassId,
      level,
      letter,
      room,
      students,
      courses,
      createdAt,
      updatedAt,
      v,
      year,
    ];
  }
}
