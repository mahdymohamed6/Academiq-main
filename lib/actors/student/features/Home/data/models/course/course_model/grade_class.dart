class GradeClass {
  String? gradeClassId;
  int? gradeLevel;

  GradeClass({this.gradeClassId, this.gradeLevel});

  factory GradeClass.fromJson(Map<String, dynamic> json) => GradeClass(
        gradeClassId: json['gradeClassId'] as String?,
        gradeLevel: json['gradeLevel'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'gradeClassId': gradeClassId,
        'gradeLevel': gradeLevel,
      };
}
