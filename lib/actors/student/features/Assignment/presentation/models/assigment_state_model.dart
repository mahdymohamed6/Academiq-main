import 'dart:ui';

class AssignmentStatModel {
  final Color activationColor;
  final Color nonActiveColor;
  final Color activationTextColor;
  final Color nonActiveTextColor;
  final String text;

  const AssignmentStatModel(
      {required this.activationColor,
      required this.nonActiveColor,
      required this.activationTextColor,
      required this.nonActiveTextColor,
      required this.text});
}
