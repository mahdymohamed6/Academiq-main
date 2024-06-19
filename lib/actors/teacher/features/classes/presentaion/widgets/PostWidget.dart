import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:necessities/actors/teacher/data/data_source/data_source.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/pages/PostDetails.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/widgets/PostsShowModalBottomSheetChild.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';
import 'package:intl/intl.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    Key? key,
    this.post,
    required this.courseId,
    this.postId,
  }) : super(key: key);
  final post;
  final courseId;
  final postId;
  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool showComments = false;
  String getFormattedDate(DateTime date) =>
      DateFormat('yyyy-MM-dd').format(date);
  late bool isLiked;
  late int likesCount;
  Future<void> refreshPosts() async {
    await DiscussionService().getDisucssion(courseId: widget.courseId);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    final id = GetStorage().read('id');
    isLiked = widget.post.likes.contains(id);
    likesCount = widget.post.likes.length;
  }

  void _toggleLike() async {
    final id = GetStorage().read('id');

    try {
      setState(() {
        if (isLiked) {
          isLiked = false;
          likesCount -= 1;
          widget.post.likes.remove(id);
        } else {
          isLiked = true;
          likesCount += 1;
          widget.post.likes.add(id);
        }
      });
      await DiscussionService().likePost(postId: widget.post.id);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    final id = GetStorage().read('id');
    isLiked = widget.post.likes.contains(id) ? true : false;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return PostDetails(
                    post: widget.post, courseId: widget.courseId);
              }));
              DiscussionService().getPost(postId: widget.post.id);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color.fromARGB(255, 229, 227, 227),
                  width: 2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: CircleAvatar(
                              radius: 24,
                              backgroundImage:
                                  AssetImage('assets/images/Ellipse 136.png'),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${widget.post.creator.name.first} ${widget.post.creator.name.last}',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  fontFamily: 'poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                getFormattedDate(widget.post.createdAt),
                                style: TextStyle(
                                  color: Color.fromRGBO(153, 153, 153, 1),
                                  fontFamily: 'poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            padding: EdgeInsets.zero,
                            color: Color.fromARGB(89, 89, 89, 1),
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) =>
                                      PostsShowModalBottomSheetChild(
                                        courseId: widget.courseId,
                                        onPostAdded: refreshPosts,
                                        content: widget.post.content,
                                        postId: widget.post.id,
                                      ));
                            },
                            icon: const Icon(Icons.more_vert),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Text(
                        widget.post.content,
                        style: const TextStyle(
                          color: Color.fromRGBO(89, 89, 89, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'poppins',
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    color: Color.fromRGBO(229, 227, 227, 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              '${widget.post.likes.length}',
                              style: Style().title.copyWith(fontSize: 15),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            GestureDetector(
                              onTap: _toggleLike,
                              child: Icon(
                                isLiked
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: primaryColor1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              showComments = !showComments;
                            });
                          },
                          child: Text(
                            showComments
                                ? 'Hide comments'
                                : (widget.post.comments.isEmpty
                                    ? 'There are no comments'
                                    : '${widget.post.comments.length} comments'),
                            style: Style().title.copyWith(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (showComments)
                    FutureBuilder(
                        future: DiscussionService()
                            .getComments(postId: widget.post.id),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                                child: CircularProgressIndicator(
                              strokeWidth: 1,
                              color: primaryColor1,
                            ));
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData) {
                            return Text('No data');
                          }
                          final comments = snapshot.data;
                          final comment = comments!.postComments;
                          return ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight:
                                  300.0, // Set a max height for the comments container
                            ),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: comment!.length,
                                itemBuilder: (context, index) {
                                  final postComments = comment[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Text('${postComments.content}'),
                                  );
                                }),
                          );
                        })
                  /*  if (showComments)
                    Container(
                      height: 50,
                      child: ListView.builder(
                          itemCount: widget.post.comments.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Text(
                                  '${widget.post.comments[index]}',
                                  style: Style().title.copyWith(fontSize: 10),
                                )
                              ],
                            );
                          }),
                    ), */
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
