import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:necessities/actors/student/features/Home/domain/cubits/child_cubit.dart/child_cubit.dart';
import 'package:necessities/actors/student/features/Home/domain/cubits/child_cubit.dart/child_data_state.dart';
import 'package:necessities/core/styles.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({
    super.key,
  });

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  @override
  void initState() {
    super.initState();
    final childCubit = BlocProvider.of<ChildCubit>(context);
    childCubit.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChildCubit, ChildDataState>(
      builder: (context, state) {
        if (state is ChildDataStateLoading) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage('assets/images/girlAvtar.png'),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Grad 2',
                    style: Style().title.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ],
          );
        } else if (state is ChildDataStateSuccess) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage('assets/images/girlAvtar.png'),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    state.childEntity.userName!,
                    style: Style().title.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Grad 2',
                    style: Style().title.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ],
          );
        } else if (state is ChildDataStateFailure) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage('assets/images/girlAvtar.png'),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Student',
                    style: Style().title.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Grad 2',
                    style: Style().title.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
