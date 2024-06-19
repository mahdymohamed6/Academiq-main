import 'package:flutter/material.dart';
import 'package:necessities/actors/student/features/Assignment/presentation/widgets/customized_button.dart';
import 'package:necessities/actors/teacher/data/data_source/data_source.dart';
import 'package:necessities/constants.dart';

class PostsShowModalBottomSheetChild extends StatefulWidget {
  const PostsShowModalBottomSheetChild({
    Key? key,
    this.courseId,
    required this.onPostAdded,
    this.content,
    this.postId,
  }) : super(key: key);
  final courseId;
  final VoidCallback onPostAdded;
  final postId;
  final content;
  @override
  State<PostsShowModalBottomSheetChild> createState() =>
      _PostsShowModalBottomSheetChildState();
}

class _PostsShowModalBottomSheetChildState
    extends State<PostsShowModalBottomSheetChild> {
  late TextEditingController postController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  void addPost() async {
    try {
      await DiscussionService().addPost(
        content: postController.text,
        courseId: widget.courseId,
      );
      Navigator.pop(context);
      widget.onPostAdded();
    } catch (e) {
      // Handle error
    }
  }

  void updatePost() async {
    try {
      await DiscussionService().updatePost(
        content: postController.text,
        postId: widget.postId,
      );
      Navigator.pop(context);
      widget.onPostAdded();
    } catch (e) {
      print(e);
      // Handle error
    }
  }

  bool isEditing = false;
  @override
  void initState() {
    postController = TextEditingController(
        text: widget.content.isNotEmpty ? widget.content : null);

    isEditing = widget.content.isNotEmpty;
    // TODO: implement initState
    super.initState();
  }

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
            controller: postController,
            decoration: InputDecoration(
              hintText: 'Enter your post',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor1),
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
              onPressed: addPost,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: CustomizedButton(
                text: isEditing ? 'Update' : 'Save',
                textColor: Colors.white,
                backgroundColor: primaryColor1,
                borderColor: primaryColor1,
                onTap: () async {
                  if (isEditing) updatePost();
                  if (!isEditing) addPost();
                },
              )),
        ],
      ),
    );
  }
}
