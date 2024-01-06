import 'package:flutter/material.dart';
import 'package:necessities/features/Assignment/presentation/models/assigment_state_model.dart';
import 'package:necessities/features/Assignment/presentation/widgets/assignment_list_view.dart';

import 'package:necessities/features/Assignment/presentation/widgets/assignment_title.dart';
import 'package:necessities/features/Assignment/presentation/widgets/sssignment_stat_list_view.dart';

class AssignmentView extends StatefulWidget {
  const AssignmentView({super.key});

  @override
  State<AssignmentView> createState() => _AssignmentViewState();
}

class _AssignmentViewState extends State<AssignmentView> {
  AssignmentStatModel selectedStat = const AssignmentStatModel(
    activationColor: Colors.transparent,
    nonActiveColor: Colors.transparent,
    activationTextColor: Colors.transparent,
    nonActiveTextColor: Colors.transparent,
    text: '',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AssignmentTitle(),
            const SizedBox(
              height: 34,
            ),
            AssignmentStatListView(
              onStatSelected: (stat) {
                setState(() {
                  selectedStat = stat;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            AssignmentListView(
              selectedStat: selectedStat,
            )
          ],
        ),
      ),
    );
  }
}
