import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage {
  static const tokenValue = 'TOKEN';
  static const store = 'STORAGE_BOX';

  saveToken(token) async {
    var box = await Hive.openBox(store);

    box.put(tokenValue, token);
  }

  getToken() async {
    var box = await Hive.openBox(store);

    return box.get(tokenValue);
  }

  clearToken() async {
    var box = await Hive.openBox(store);
    box.clear();
  }
}
