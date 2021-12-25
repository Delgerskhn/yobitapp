import 'package:flutter/cupertino.dart';
import 'package:yobit/constants/infrastructure/routes.dart';

class NavigationController extends ChangeNotifier {
  String screenName = Routes.Home;

  void changeScreen(String newScreenName) {
    print(newScreenName);
    screenName = newScreenName;
    notifyListeners();
  }
}
