import 'package:flutter/material.dart';
import 'package:necessities/features/Assignment/presentation/models/assigment_state_model.dart';
import 'package:necessities/features/Assignment/presentation/widgets/assignment_list_view_item.dart';

class AssignmentListView extends StatelessWidget {
  const AssignmentListView({
    super.key,
    required this.selectedStat,
  });
  final AssignmentStatModel selectedStat;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AssignmentListViewItem(
              selectedStat: selectedStat,
            ),
          );
        },
      ),
    );
  }
}
