import 'package:flutter/material.dart';
import 'package:necessities/features/Assignment/presentation/models/assigment_state_model.dart';
import 'package:necessities/features/Assignment/presentation/pages/AssignmentDetails.dart';

class AssignmentListViewItem extends StatelessWidget {
  const AssignmentListViewItem({
    super.key,
    required this.selectedStat,
  });
  final AssignmentStatModel selectedStat;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      decoration: BoxDecoration(
        color: (selectedStat.nonActiveColor == Colors.transparent)
            ? const Color(0xFFE5F1F8)
            : selectedStat.nonActiveColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  'Arabic',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF000000)),
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  'M.Nada ahmed',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF858585)),
                ),
                Spacer(),
                Text(
                  '8:00 PM',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF454647)),
                )
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Container(
                  width: 250.0,
                  child: const Text(
                    'I want to view the titles of tasks or assignments assigned by my teachers for todays homework...',
                    style: TextStyle(color: Color(0xFF454647)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AssignmentsDetails()),
                    );
                    // Your other onTap logic here
                  },
                  child: Container(
                    height: 35,
                    width: 68,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: (selectedStat.activationColor ==
                              Colors.transparent)
                          ? const Color(
                              0xFF00769E) // Set color to a specific value when nonActiveColor is transparent
                          : selectedStat.activationColor,
                    ),
                    child: const Center(
                      child: Text(
                        'View',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFFF6F6F6)),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
