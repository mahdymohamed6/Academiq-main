import 'package:flutter/material.dart';
import 'package:necessities/actors/student/features/Assignment/data/service/assignment_service.dart';
import 'package:necessities/actors/student/features/Assignment/domain/entities/assignment_entity.dart';
import 'package:necessities/actors/student/features/Assignment/presentation/models/assigment_state_model.dart';
import 'package:necessities/actors/student/features/Assignment/presentation/widgets/assignment_list_view.dart';

import 'package:necessities/actors/student/features/Assignment/presentation/widgets/assignment_title.dart';
import 'package:necessities/actors/student/features/Assignment/presentation/widgets/sssignment_stat_list_view.dart';

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
    status: '',
  );

  Future<List<AssignmentEntity>>? _assignmentsFuture;

  @override
  void initState() {
    super.initState();
    _assignmentsFuture = getStudentAssignments();
  }

  Future<List<AssignmentEntity>> getStudentAssignments() async {
    return await AssignmentService().getAssignments();
  }

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
            FutureBuilder(
              future: _assignmentsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.28,
                      ),
                      Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasData) {
                  List<AssignmentEntity> assignments = snapshot.data!;
                  if (assignments.isEmpty) {
                    return const Center(
                      child: Text('There are no assignments.'),
                    );
                  } else {
                    return AssignmentListView(
                      selectedStat: selectedStat,
                      AssignmentList: assignments,
                    );
                  }
                } else {
                  return Text('Error: ${snapshot.error}');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
