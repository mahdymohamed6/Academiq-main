class AssignmentEntity {
  String? id;
  String? creatorId;
  String? type;
  int? score;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? courseId;
  String? description; // Add the description field here
  int? duration;
  DateTime? endDate;
  String? gradeClassId;
  DateTime? startDate;
  String? title;
  List<dynamic>? materials;
  bool? isSubmitted;

  AssignmentEntity({
    this.id,
    this.creatorId,
    this.type,
    this.score,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.courseId,
    this.description, // Add the description field here
    this.duration,
    this.endDate,
    this.gradeClassId,
    this.startDate,
    this.title,
    this.materials,
    this.isSubmitted,
  });

  factory AssignmentEntity.fromJson(Map<String, dynamic> json) {
    return AssignmentEntity(
      id: json['_id'] as String?,
      creatorId: json['creatorId'] as String?,
      type: json['type'] as String?,
      score: json['score'] as int?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      courseId: json['courseId'] as String?,
      description:
          json['description'] as String?, // Add the description field here
      duration: json['duration'] as int?,
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      gradeClassId: json['gradeClassId'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      title: json['title'] as String?,
      materials: json['materials'] as List<dynamic>?,
      isSubmitted: json['isSubmitted'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'creatorId': creatorId,
        'type': type,
        'score': score,
        'status': status,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'courseId': courseId,
        'description': description, // Add the description field here
        'duration': duration,
        'endDate': endDate?.toIso8601String(),
        'gradeClassId': gradeClassId,
        'startDate': startDate?.toIso8601String(),
        'title': title,
        'materials': materials,
        'isSubmitted': isSubmitted,
      };
}
