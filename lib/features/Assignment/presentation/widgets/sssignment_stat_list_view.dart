import 'package:flutter/material.dart';
import 'package:necessities/features/Assignment/presentation/models/assigment_state_model.dart';
import 'package:necessities/features/Assignment/presentation/widgets/assignment_state_item_list_view.dart';

class AssignmentStatListView extends StatefulWidget {
  const AssignmentStatListView({
    super.key,
    required this.onStatSelected,
  });
  final Function(AssignmentStatModel) onStatSelected;
  @override
  State<AssignmentStatListView> createState() => _AssignmentStatListViewState();
}

class _AssignmentStatListViewState extends State<AssignmentStatListView> {
  final List<AssignmentStatModel> stats = const [
    AssignmentStatModel(
        activationColor: Color(0xFF00769E),
        nonActiveColor: Color(0xFFE5F1F8),
        activationTextColor: Color(0xFFF6F6F6),
        nonActiveTextColor: Color(0xFF00769E),
        text: 'Active'),
    AssignmentStatModel(
        activationColor: Color(0xFF26B170),
        nonActiveColor: Color(0xFFE9F8FB),
        activationTextColor: Color(0xFFF6F6F6),
        nonActiveTextColor: Color(0xFF26B170),
        text: 'Overdue'),
    AssignmentStatModel(
        activationColor: Color(0xFFE84260),
        nonActiveColor: Color(0xFFFFEDF7),
        activationTextColor: Color(0xFFF6F6F6),
        nonActiveTextColor: Color(0xFFE84260),
        text: 'Missing'),
  ];

  late int activeIndex; // No need to initialize it here

  @override
  void initState() {
    super.initState();
    // Set the initial activeIndex to the index of "Active" when the screen is first opened
    activeIndex = stats.indexWhere((stat) => stat.text == 'Active');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stats.length,
        itemBuilder: (context, index) {
          return AssignmentStateItemListView(
            state: stats[index],
            isActive: activeIndex == index,
            onTap: () {
              setState(() {
                activeIndex = index;
              });
              widget.onStatSelected(stats[index]);
            },
          );
        },
      ),
    );
  }
}
