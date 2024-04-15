import 'package:get_storage/get_storage.dart';

class UserData {
  saveData(
      {required String token,
      required String role,
      }) async {
    await GetStorage().write('token', token);
    await GetStorage().write('role', role);

  }
}
