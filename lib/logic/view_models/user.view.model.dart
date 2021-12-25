import 'package:dartz/dartz.dart';
import 'package:yobit/constants/infrastructure/strings.dart';
import 'package:yobit/logic/models/user.dart';
import 'package:flutter/cupertino.dart';

class UserViewModel extends ChangeNotifier {
  User? user;

  UserViewModel();

  void setUser(User user) {
    this.user = user;
    print(user.userName);
    notifyListeners();
  }

  User? getUser() => user;

  getWelcomeMsg() {
    return Strings.hello +
        ' ' +
        (user != null ? user!.userName : Strings.unknown);
  }
}
