import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:necessities/actors/student/features/Home/data/data_source/get_student_courses.dart';
import 'package:necessities/actors/student/features/Home/domain/cubits/courses_cubit.dart/courses_cubit_state.dart';
import 'package:necessities/actors/student/features/Home/domain/entitiy/cours_entity.dart';

class CoursesCubit extends Cubit<CoursestState> {
  CoursesCubit() : super(CoursesStateLoading());
  List<CourseEntity>? courseEntityList;

  void getCourses() async {
    emit(CoursesStateLoading());

    try {
      courseEntityList = await getStudentCourses();
      emit(CoursesStateSuccess(courseEntity: courseEntityList!));
    } on Exception catch (e) {
      emit(CoursestStateFailure());
    }
  }
}
