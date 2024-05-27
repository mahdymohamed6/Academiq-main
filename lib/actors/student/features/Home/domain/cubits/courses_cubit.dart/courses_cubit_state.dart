import 'package:necessities/actors/student/features/Home/domain/entitiy/child_entity.dart';
import 'package:necessities/actors/student/features/Home/domain/entitiy/cours_entity.dart';

abstract class CoursestState {}

class CoursesStateLoading extends CoursestState {}

class CoursesStateSuccess extends CoursestState {
  final List<CourseEntity> courseEntity;

  CoursesStateSuccess({required this.courseEntity});
}

class CoursestStateFailure extends CoursestState {}
