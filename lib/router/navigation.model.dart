import 'package:firebase_auth/firebase_auth.dart';
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
  FirebaseAuth auth = FirebaseAuth.instance;

  _init() async {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      loggedIn = user != null;
      if (loggedIn!)
        onLogin();
      else
        onLogout();
    });
  }

  List<Page> stack = splashStack();

  void onLogin() {
    loggedIn = true;
    stack = loggedInStack();
    notifyListeners();
  }

  void onLogout() {
    loggedIn = false;
    stack = loggedOutStack();
    notifyListeners();
  }
}
