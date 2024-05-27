import 'package:get_storage/get_storage.dart';

class StudentData {
  void saveData({
    required String id,
  }) {
    GetStorage().write('id', id);
  }

  void DeleteData() {
    GetStorage().remove('id');
    GetStorage().remove('role');
  }

  String getGradeClassId() {
    return GetStorage().read('id');
  }
}
