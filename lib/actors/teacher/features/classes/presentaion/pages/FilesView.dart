import 'package:flutter/material.dart';
import 'package:necessities/actors/student/features/Classes/data/datasources/remote_data_source.dart';
import 'package:necessities/actors/student/features/Classes/data/models/OneCourse/one_course/one_course.dart';
import 'package:necessities/actors/student/features/Classes/data/models/courses/course.dart';
import 'package:necessities/actors/student/features/Classes/data/models/courses/courses.dart';
import 'package:necessities/actors/teacher/data/models/discussions/discussions.dart';
import 'package:necessities/constants.dart';
import 'package:intl/intl.dart';
import 'package:necessities/core/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class FilesView extends StatelessWidget {
  const FilesView({
    super.key,
    this.courseId,
  });
  final courseId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<OneCourse>(
      future: CoursesService().getCourseById(id: courseId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: primaryColor1,
          ));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData ||
            snapshot.data!.course!.materials!.isEmpty) {
          return Center(
            child: Text(
              'There are no files',
              style: Style().title.copyWith(color: primaryColor1),
            ),
          );
        }
        final courses = snapshot.data!.course!;

        return ListView.builder(
          itemCount: courses.materials!.length,
          itemBuilder: (BuildContext context, int index) {
            final material = courses.materials![index];
            return FiledListViewItem(material: material);
          },
        );
      },
    );
  }
}

class FiledListViewItem extends StatelessWidget {
  const FiledListViewItem({
    super.key,
    this.material,
  });
  final material;
  String getFormattedDate(DateTime date) =>
      DateFormat('yyyy-MM-dd').format(date);
  static const int maxTitleLength = 30; // Set maximum title length

  @override
  Widget build(BuildContext context) {
    String title = material.title;
    if (title.length > maxTitleLength) {
      title = '${title.substring(0, maxTitleLength)}...';
    }
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 5, right: 5),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('assets/images/pdf.png'),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
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
                      '${getFormattedDate(material.uploadDate)}',
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
              GestureDetector(
                  onTap: () async {
                    final url = Uri.parse(material.url);

                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios_sharp))
            ],
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
