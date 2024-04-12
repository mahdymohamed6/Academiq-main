import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool showComments = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
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
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Khaled Mamdouh',
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
                              'Apr 12, 2024',
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
                      widget.text,
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
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        showComments = !showComments;
                      });
                    },
                    child: Text(
                      showComments ? 'Hide comments' : '8 comments',
                      style: const TextStyle(
                        color: Color.fromRGBO(153, 153, 153, 1),
                        fontSize: 12,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                if (showComments)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Render your comments here
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Comment 1'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Comment 2'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Comment 3'),
                        ),
                        // ...
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
