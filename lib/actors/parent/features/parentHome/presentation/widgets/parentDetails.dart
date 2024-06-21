import 'package:flutter/material.dart';
import 'package:necessities/actors/student/features/Home/domain/entitiy/child_entity.dart';

class ParentDetails extends StatelessWidget {
  const ParentDetails({
    super.key,
    required this.textStyle,
    required this.childEntity,
  });

  final TextStyle textStyle;
  final ChildEntity childEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            '${childEntity.userName}',
            style: textStyle,
          ),
        ),
      ],
    );
  }
}
