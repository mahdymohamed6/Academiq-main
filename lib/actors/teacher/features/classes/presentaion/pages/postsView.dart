import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:necessities/actors/teacher/data/data_source/data_source.dart';
import 'package:necessities/actors/teacher/data/models/discussions/discussions.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/widgets/AddPostBar.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/widgets/PostWidget.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/widgets/PostsShowModalBottomSheetChild.dart';
import 'package:necessities/constants.dart';

class PostsView extends StatefulWidget {
  const PostsView({Key? key, this.courseId}) : super(key: key);
  final courseId;

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  Future<void> refreshPosts() async {
    await DiscussionService().getDisucssion(courseId: widget.courseId);
    setState(() {});
  }

  bool isTeacher = true;
  final role = GetStorage().read('role');

  @override
  void initState() {
    super.initState();

    if (role == 'teacher') {
      isTeacher = true;
    } else {
      isTeacher = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> texts = [
      'Quiz-ll will be held next Sunday April 12 at 11:00 am. Prepare internet access and yourself in advanced becouse of the exame time will be regarded strictly in the released scorse in delay in the exame submition time  the score will not be concidered best of luck to all',
      'Attention, students! Just a reminder that the deadline for your science project is approaching. Make sure you submit your projects by Friday. Im excited to see your creative ideas!',
      'good morning'
    ];

    return Column(
      children: [
        if (isTeacher)
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => PostsShowModalBottomSheetChild(
                          courseId: widget.courseId,
                          onPostAdded: refreshPosts,
                          content: '',
                        ));
              },
              child: const AddPostBar(),
            ),
          ),
        Expanded(
            child: FutureBuilder<Discussions>(
          future: DiscussionService().getDisucssion(courseId: widget.courseId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: primaryColor1,
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return Text('No data');
            }
            final discussions = snapshot.data!;
            final posts = discussions.discussion!.posts;
            if (posts!.isEmpty) {
              return Center(
                child: Text('No posts'),
              );
            }
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                final discussion = discussions.discussion!.posts![index];
                final courseId = discussions.discussion!.courseId;
                final postId = discussions.discussion!.posts![index].id;
                return Column(
                  children: <Widget>[
                    PostWidget(
                      postId: postId,
                      post: discussion,
                      courseId: courseId,
                    ),
                  ],
                );
              },
            );
          },
        )),
        if (isTeacher = false)
          Expanded(
            child: FutureBuilder<Discussions>(
                future: DiscussionService()
                    .getDisucssion(courseId: widget.courseId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: primaryColor1,
                    ));
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData) {
                    return Text('No data');
                  }
                  final discussions = snapshot.data!;
                  final posts = discussions.discussion!.posts;
                  return ListView.builder(
                    itemCount: posts!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final discussion = discussions.discussion!.posts![index];
                      final courseId = discussions.discussion!.courseId;
                      final postId = discussions.discussion!.posts![index].id;
                      return Column(
                        children: <Widget>[
                          PostWidget(
                              postId: postId,
                              post: discussion,
                              courseId: courseId),
                        ],
                      );
                    },
                  );
                }),
          )
      ],
    );
  }
}
