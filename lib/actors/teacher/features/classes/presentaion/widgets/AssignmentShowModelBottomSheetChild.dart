import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';

class AssignmentShowModalBottomSheetChild extends StatelessWidget {
  const AssignmentShowModalBottomSheetChild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 55),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter the Assignment name',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor1),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter The DeadLine',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor1),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter the Assignment',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor1),
              ),
            ),
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Text(
              'Post',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
