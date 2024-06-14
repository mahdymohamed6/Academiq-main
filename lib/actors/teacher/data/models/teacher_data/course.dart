class Course {
  String? id;
  String? courseId;
  String? title;
  String? department;
  bool? isActive;

  Course({
    this.id,
    this.courseId,
    this.title,
    this.department,
    this.isActive,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json['_id'] as String?,
        courseId: json['courseId'] as String?,
        title: json['title'] as String?,
        department: json['department'] as String?,
        isActive: json['isActive'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'courseId': courseId,
        'title': title,
        'department': department,
        'isActive': isActive,
      };
}
