import 'package:flutter/material.dart';
import 'package:necessities/actors/teacher/data/data_source/data_source.dart';
import 'package:necessities/actors/teacher/data/models/discussions/discussions.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/widgets/AddPostBar.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/widgets/PostWidget.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/widgets/PostsShowModalBottomSheetChild.dart';
import 'package:necessities/constants.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> texts = [
      'Quiz-ll will be held next Sunday April 12 at 11:00 am. Prepare internet access and yourself in advanced becouse of the exame time will be regarded strictly in the released scorse in delay in the exame submition time  the score will not be concidered best of luck to all',
      'Attention, students! Just a reminder that the deadline for your science project is approaching. Make sure you submit your projects by Friday. Im excited to see your creative ideas!',
      'good morning'
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const PostsShowModalBottomSheetChild());
            },
            child: const AddPostBar(),
          ),
        ),
        Expanded(
          child: FutureBuilder<Discussions>(
              future: DiscussionService()
                  .getDisucssion(courseId: '66478b55f7f1e51644381c88'),
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
                    return Column(
                      children: <Widget>[
                        PostWidget(
                          post: discussion,
                        ),
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
