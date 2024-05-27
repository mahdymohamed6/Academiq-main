import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:necessities/actors/student/features/Classes/data/models/courses/course.dart';
import 'package:necessities/actors/student/features/Classes/data/models/courses/courses.dart';
import 'package:necessities/actors/teacher/data/models/OnePost/one_post/one_post.dart';
import 'package:necessities/actors/teacher/data/models/comments/comments.dart';
import 'package:necessities/actors/teacher/data/models/discussions/discussion.dart';
import 'package:necessities/actors/teacher/data/models/discussions/discussions.dart';
import 'package:necessities/actors/teacher/data/models/discussions/post.dart';
import 'package:necessities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:necessities/core/resources/user_data.dart';

class DiscussionService {
  Future<Discussions> getDisucssion({required String courseId}) async {
    final url = Uri.parse(baseUrl + 'discussions/$courseId');
    final token = GetStorage().read('token');

    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> discussions = jsonDecode(response.body);

      print('course are' + '${discussions}');
      return Discussions.fromJson(discussions);
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<OnePost> getPost({required String postId}) async {
    final url = Uri.parse(baseUrl + 'discussions/posts/$postId');
    final token = GetStorage().read('token');

    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> post = jsonDecode(response.body);

      print('post is' + '${post}');
      return OnePost.fromJson(post);
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<Comments> getComments({required String postId}) async {
    final url = Uri.parse(baseUrl + 'discussions/posts/comments/$postId');
    final token = GetStorage().read('token');

    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> comments = jsonDecode(response.body);

      print('comemnts are' + '${comments}');
      return Comments.fromJson(comments);
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<http.Response> likePost({
    required String postId,
  }) async {
    final url = Uri.parse(baseUrl + 'discussions/posts/likes/$postId');
    String token = UserData().getToken();

    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    print('likedd');
    return response;
  }
}
