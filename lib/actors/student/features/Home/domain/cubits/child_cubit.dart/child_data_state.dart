import 'package:necessities/actors/student/features/Home/domain/entitiy/child_entity.dart';

abstract class ChildDataState {}

class ChildDataStateLoading extends ChildDataState {}

class ChildDataStateSuccess extends ChildDataState {
  final ChildEntity childEntity;

  ChildDataStateSuccess({required this.childEntity});
}

class ChildDataStateFailure extends ChildDataState {}
