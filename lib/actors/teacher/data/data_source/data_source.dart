import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:necessities/actors/student/features/Classes/data/models/courses/course.dart';
import 'package:necessities/actors/student/features/Classes/data/models/courses/courses.dart';
import 'package:necessities/actors/teacher/data/models/Attendance/attendance_student/attendance_student.dart';

import 'package:necessities/actors/teacher/data/models/GradeClass/grade_of_classes/grade_of_classes.dart';
import 'package:necessities/actors/teacher/data/models/GradeClassStudents/grade_class_students/grade_class_students.dart';
import 'package:necessities/actors/teacher/data/models/OnePost/one_post/one_post.dart';
import 'package:necessities/actors/teacher/data/models/comments/comments.dart';
import 'package:necessities/actors/teacher/data/models/discussions/discussion.dart';
import 'package:necessities/actors/teacher/data/models/discussions/discussions.dart';
import 'package:necessities/actors/teacher/data/models/discussions/post.dart';
import 'package:necessities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:necessities/core/resources/user_data.dart';

class DiscussionService {
  Future<AttendanceStudent> getAttendance({required String id}) async {
    final url = Uri.parse(
        baseUrl + 'gradeClasses/$id/attendance?date=2024-06-04&period=2 ');
    final token = GetStorage().read('token');

    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> attendance = jsonDecode(response.body);

      print('attendance are' + '${attendance}');
      return AttendanceStudent.fromJson(attendance);
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<void> takeAttendance(
      {required List students,
      required String courseId,
      required int period}) async {
    final url = Uri.parse(
        'https://academiq.onrender.com/gradeClasses/66283d3721ad54ce0d9246d3/attendance');
    String token = UserData().getToken();

    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "students": students,
        "period": period,
        "courseId": courseId,
      }),
    );
    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      print('attendance is taken successfuly');
      print(responseData);
    } else {
      print(response.body);
      print(response.request);
      print(response.statusCode);
    }
  }

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

  Future<void> addPost(
      {required String content, required String courseId}) async {
    final url = Uri.parse(baseUrl + 'discussions/posts/');
    String token = UserData().getToken();

    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "content": content,
        "courseId": courseId,
      }),
    );
    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      print('post is added successfuly');
      print(responseData);
    } else {
      print(response.body);
      print(response.request);
      print(response.statusCode);
    }
  }

  Future<http.Response> updatePost(
      {required String content, required String postId}) async {
/*     final url = Uri.parse(baseUrl + 'discussions/posts/$postId');
 */
    final url =
        Uri.parse('https://academiq.onrender.com/discussions/posts/${postId}');
    String token = UserData().getToken();

    final response = await http.put(url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "content": content,
        }));

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      print('post edit success');
    } else {
      print(response.body);
      print(response.request);
      print(response.statusCode);
      print(response.reasonPhrase);
    }
    return response;
  }

  Future<void> addComment(
      {required String postId,
      required String content,
      required String courseId}) async {
    final url = Uri.parse(baseUrl + 'discussions/posts/comments/${postId}');
    String token = UserData().getToken();

    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "content": content,
        "courseId": courseId,
      }),
    );
    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      print('comment is added successfuly');
      print(responseData);
    } else {
      print(response.body);
      print(response.request);
      print(response.statusCode);
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

  Future<GradeOfClasses> getGradeClasses() async {
    final url = Uri.parse(baseUrl + 'gradeClasses/');
    final token = GetStorage().read('token');

    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> gradeClasses = jsonDecode(response.body);

      print('grade Classes are' + '${gradeClasses}');
      return GradeOfClasses.fromJson(gradeClasses);
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<Courses> getCoursesByGradeClass({required String gradeClassId}) async {
    final url = Uri.parse(baseUrl + 'courses/gradeClasses/${gradeClassId}');
    final token = GetStorage().read('token');

    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> course = jsonDecode(response.body);

      print('grade Classes are' + '${course}');
      return Courses.fromJson(course);
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<GradeClassStudents> getGradeClassStudents(
      {required String gradeClassId}) async {
    final url = Uri.parse(
        baseUrl + 'gradeClasses/${gradeClassId}/students?points=true');
    final token = GetStorage().read('token');

    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> gradeClasses = jsonDecode(response.body);

      print('grade Classes are' + '${gradeClasses}');
      return GradeClassStudents.fromJson(gradeClasses);
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
