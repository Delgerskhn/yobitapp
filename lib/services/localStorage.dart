import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yobit/utils/json.dart';

class LocalStorage {
  final SharedPreferences prefs;
  const LocalStorage(this.prefs);

  void _saveString(String key, String value) async {
    prefs.setString(key, value);
  }

  void saveData(String key, Object value) async {
    _saveString(key, jsonToString(value));
  }

  Future<Option<String>> getData(String key) async {
    var str = prefs.getString(key);
    if (str != null) return Some(str);
    return None();
// Try reading data from the counter key. If it doesn't exist, return 0.
  }

  Future removeData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
