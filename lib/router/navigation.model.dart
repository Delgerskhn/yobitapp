import 'package:flutter/material.dart';
import 'package:yobit/router/stacks.dart';
import 'package:yobit/services/auth.repository.dart';

class NavigationModel extends ChangeNotifier {
  bool? _loggedIn;
  bool? get loggedIn => _loggedIn;

  bool onPopPage(route, result) {
    if (!route.didPop(result)) return false;
    return true;
  }

  set loggedIn(value) {
    _loggedIn = value;
    notifyListeners();
  }

  final AuthRepository authRepository;

  NavigationModel(this.authRepository) {
    _init();
  }

  _init() async {
    loggedIn = await authRepository.isUserLoggedIn();
    if (loggedIn!)
      onLogin();
    else
      onLogout();
  }

  List<Page> stack = splashStack();

  void onLogin() {
    loggedIn = true;
    stack = loggedInStack();
  }

  void onLogout() {
    loggedIn = false;
    stack = loggedOutStack();
  }
}
