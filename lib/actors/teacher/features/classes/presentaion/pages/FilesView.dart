import 'package:flutter/material.dart';

class FilesView extends StatelessWidget {
  const FilesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 12),
      child: Expanded(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return const FiledListViewItem();
          },
        ),
      ),
    );
  }
}

class FiledListViewItem extends StatelessWidget {
  const FiledListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset('assets/images/pdf.png'),
            const SizedBox(
              width: 16,
            ),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chapter 1, Lesson 5',
                    style: TextStyle(
                      color: Color.fromRGBO(32, 32, 32, 1),
                      fontSize: 16,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '40 KB, Microsoft edge pdf document',
                    style: TextStyle(
                      color: Color.fromRGBO(153, 153, 153, 1),
                      fontSize: 12,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
