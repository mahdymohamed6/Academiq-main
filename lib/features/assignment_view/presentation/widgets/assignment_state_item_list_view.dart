import 'package:flutter/material.dart';
import 'package:necessities/features/assignment_view/presentation/models/assigment_state_model.dart';

class AssignmentStateItemListView extends StatelessWidget {
  const AssignmentStateItemListView({
    Key? key,
    required this.state,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  final AssignmentStatModel state;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: onTap,
        child: FittedBox(
          child: Container(
            decoration: BoxDecoration(
                color: isActive ? state.activationColor : state.nonActiveColor,
                borderRadius: BorderRadiusDirectional.circular(22)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Text(
                state.text,
                style: TextStyle(
                  color: isActive
                      ? state.activationTextColor
                      : state.nonActiveTextColor,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
