class CourseEntity {
  final String? courseId;
  final String? title;
  final String? department;
  final String? startDate;
  final String? endDate;
  CourseEntity(
      {required this.startDate,
      required this.endDate,
      required this.courseId,
      required this.title,
      required this.department});
}
