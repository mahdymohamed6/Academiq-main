import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:necessities/actors/student/features/Home/data/data_source/gat_user_service.dart';
import 'package:necessities/actors/student/features/Home/domain/cubits/child_cubit.dart/child_data_state.dart';
import 'package:necessities/actors/student/features/Home/domain/entitiy/child_entity.dart';

class ChildCubit extends Cubit<ChildDataState> {
  ChildCubit() : super(ChildDataStateLoading());
  ChildEntity? childEntity;

  void getUserData() async {
    emit(ChildDataStateLoading());

    try {
      // childEntity = await fetchUserData();
      emit(ChildDataStateSuccess(childEntity: childEntity!));
    } on Exception catch (e) {
      emit(ChildDataStateFailure());
    }
  }
}
