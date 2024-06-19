import 'package:flutter/material.dart';
import 'package:necessities/actors/student/features/Assignment/domain/entities/assignment_entity.dart';
import 'package:necessities/actors/student/features/Assignment/presentation/models/assigment_state_model.dart';
import 'package:necessities/actors/student/features/Assignment/presentation/widgets/assignment_list_view_item.dart';

class AssignmentListView extends StatelessWidget {
  const AssignmentListView(
      {super.key,
      required this.selectedStat,
      // ignore: non_constant_identifier_names
      required this.AssignmentList});
  final AssignmentStatModel selectedStat;
  // ignore: non_constant_identifier_names
  final List<AssignmentEntity> AssignmentList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: AssignmentList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AssignmentListViewItem(
              selectedStat: selectedStat,
              assignmentEntity: AssignmentList[index],
            ),
          );
        },
      ),
    );
  }
}
