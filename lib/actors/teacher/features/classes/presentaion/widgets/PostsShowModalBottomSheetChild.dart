import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';

class PostsShowModalBottomSheetChild extends StatelessWidget {
  const PostsShowModalBottomSheetChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 50),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter your post',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor1),
              ),
            ),
          ),
          const SizedBox(height: 24),
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
