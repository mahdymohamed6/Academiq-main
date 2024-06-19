import 'package:get_storage/get_storage.dart';
import 'package:necessities/actors/parent/data/Models/Children/childs/childs.dart';
import 'package:necessities/actors/parent/data/Models/Parents/parent_by_child/parent_by_child.dart';
import 'package:necessities/actors/parent/data/Models/global_discussions/global/global.dart';
import 'package:necessities/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ParentChildService {
  Future<Childs> getChildren({required String parentId}) async {
    final url = Uri.parse(baseUrl + 'users/students/parents/${parentId}');
    final token = GetStorage().read('token');

    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> childs = jsonDecode(response.body);

      print('childrenss are' + '${childs}');
      return Childs.fromJson(childs);
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<ParentByChild> getParents({required String studentId}) async {
    final url = Uri.parse(baseUrl + 'users/parents/students/${studentId}');
    final token = GetStorage().read('token');

    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> parents = jsonDecode(response.body);

      print('parents are' + '${parents}');
      return ParentByChild.fromJson(parents);
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<Global> getGlobalAnnouncement() async {
    final url = Uri.parse(baseUrl + 'discussions/global');
    final token = GetStorage().read('token');

    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> global = jsonDecode(response.body);

      print('global are' + '${global}');
      return Global.fromJson(global);
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
