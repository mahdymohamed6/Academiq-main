import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:necessities/actors/teacher/data/data_source/data_source.dart';
import 'package:necessities/actors/teacher/data/models/discussions/discussions.dart';
import 'package:necessities/actors/teacher/data/models/discussions/post.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';
import 'package:intl/intl.dart';

class PostDetails extends StatefulWidget {
  final post;
  const PostDetails({super.key, required this.post});

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  String getFormattedDate(DateTime date) =>
      DateFormat('yyyy-MM-dd').format(date);
  late bool isLiked;
  late int likesCount;

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
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FutureBuilder(
            future: DiscussionService().getPost(postId: widget.post.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
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
              return Padding(
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
                                  backgroundImage: AssetImage(
                                      'assets/images/Ellipse 136.png'),
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
                            Text(
                              widget.post.comments.isEmpty
                                  ? 'There are No comments'
                                  : '${widget.post.comments.length} comments',
                              style: Style().title.copyWith(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
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
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: comment!.length,
                                itemBuilder: (context, index) {
                                  final postComments = comment[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 14.0, bottom: 5),
                                    child: Text('${postComments.content}'),
                                  );
                                });
                          })
                    ],
                  ),
                ),
              );
            })
      ],
    ));

    /*  */
  }
}
