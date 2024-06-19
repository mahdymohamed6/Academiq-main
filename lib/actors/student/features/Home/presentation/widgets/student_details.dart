import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:necessities/actors/student/features/Home/domain/entitiy/child_entity.dart';
import 'package:necessities/core/styles.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({
    super.key,
    required this.childEntity,
  });
  final ChildEntity childEntity;

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  @override
  Widget build(BuildContext context) {
    GetStorage().write('name', widget.childEntity.userName!);
    String name = GetStorage().read('name');

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
              name,
              style: Style().title.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Grad ',
              style: Style().title.copyWith(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
