import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:necessities/actors/teacher/data/data_source/data_source.dart';
import 'package:necessities/actors/teacher/data/models/discussions/discussions.dart';
import 'package:necessities/actors/teacher/data/models/discussions/post.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/widgets/TeacherAppBar.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';
import 'package:intl/intl.dart';

class PostDetails extends StatefulWidget {
  final post;
  final courseId;
  const PostDetails({super.key, required this.post, this.courseId});

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  String getFormattedDate(DateTime date) =>
      DateFormat('yyyy-MM-dd').format(date);
  late bool isLiked;
  late int likesCount;
  bool showComments = false;

  var comments = [];

  @override
  void initState() {
    super.initState();
    final id = GetStorage().read('id');
    DiscussionService().getPost(postId: widget.post.id);
    DiscussionService().getComments(postId: widget.post.id);
    isLiked = widget.post.likes.contains(id);
    likesCount = widget.post.likes.length;
    fetchComments();
  }

  void fetchComments() async {
    try {
      final commentsData =
          await DiscussionService().getComments(postId: widget.post.id);
      setState(() {
        comments = commentsData.postComments!;
      });
    } catch (e) {}
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

  Future<void> addComment(String content) async {
    try {
      await DiscussionService().addComment(
        postId: widget.post.id,
        content: content,
        courseId: widget.courseId,
      );
      fetchComments();
    } catch (e) {}
  }

  final TextEditingController commentController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            buildTeacherAppBar(context, 'Post', false) as PreferredSizeWidget,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 34),
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
                              onPressed: () {},
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
                    Form(
                      key: formkey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: commentController,
                                decoration: InputDecoration(
                                  hintText: 'Add Comment',
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 6),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 96, 95, 95),
                                        width: 1.7),
                                  ),
                                ),
                                onFieldSubmitted: (value) {
                                  if (formkey.currentState!.validate()) {
                                    addComment(value);
                                    commentController.clear();
                                    widget.post.comments.length++;
                                  }
                                },
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.send, color: primaryColor1),
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  addComment(commentController.text);
                                  commentController.clear();
                                  widget.post.comments.length++;
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    if (showComments)
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          final postComments = comments[index];
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 14.0, bottom: 5),
                            child: Row(
                              children: [
                                Text('${index + 1}: '),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('${postComments.content}'),
                              ],
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
            )
          ],
        ));

    /*  */
  }
}
