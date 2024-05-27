import 'package:get_storage/get_storage.dart';

class UserData {
  void saveData({
    required String token,
    required String role,
    required String id,
  }) {
    GetStorage().write('token', token);
    GetStorage().write('role', role);
    GetStorage().write('id', id);
  }

  void DeleteData() {
    GetStorage().remove('token');
    GetStorage().remove('role');
  }

  String getToken() {
    return GetStorage().read('token');
  }

  String getId() {
    return GetStorage().read('id');
  }
}
