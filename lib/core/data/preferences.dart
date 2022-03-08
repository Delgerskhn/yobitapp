import 'package:shared_preferences/shared_preferences.dart';

Future<bool> getIfAppInitializedFirstTime() async {
  final prefs = await SharedPreferences.getInstance();
  var a = prefs.getBool('appAlreadyOpenedOnce');
  prefs.setBool('appAlreadyOpenedOnce', true);
  return a == null;
}
