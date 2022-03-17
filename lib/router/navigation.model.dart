import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yobit/core/data/preferences.dart';
import 'package:yobit/router/pages/advantage.page.dart';
import 'package:yobit/router/pages/challenge.page.dart';
import 'package:yobit/router/pages/confirm.pass.page.dart';
import 'package:yobit/router/pages/forgotpass.page.dart';
import 'package:yobit/router/pages/home.page.dart';
import 'package:yobit/router/pages/login.page.dart';
import 'package:yobit/router/pages/profile.page.dart';
import 'package:yobit/router/pages/signup.page.dart';
import 'package:yobit/router/pages/splash.page.dart';
import 'package:yobit/router/pages/task.page.dart';

class NavigationModel extends ChangeNotifier {
  bool? _loggedIn;
  bool _firstTime = false;
  String? challengeId;
  String? taskId;

  bool? get loggedIn => _loggedIn;

  bool onPopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) return false;
    stack.removeLast();
    return true;
  }

  set loggedIn(value) {
    _loggedIn = value;
    notifyListeners();
  }

  NavigationModel() {
    _init();
  }
  FirebaseAuth auth = FirebaseAuth.instance;

  _init() async {
    getIfAppInitializedFirstTime().then((value) {
      _firstTime = value;
      FirebaseAuth.instance.authStateChanges().listen((user) {
        loggedIn = user != null;
        if (loggedIn!)
          onLogin();
        else
          onLogout();
      });
    });
  }

  List<Page> stack = [
    SplashPage(process: 'Splash Screen:\n\nChecking auth state')
  ];

  void onLogin() {
    loggedIn = true;
    stack = [
      HomePage(),
      // TaskPage(taskId: 'yNj6o1zx2j0XDKzbCcqk')
      ProfilePage()
    ];
    notifyListeners();
  }

  void onLogout() {
    loggedIn = false;
    stack = [LoginPage(), if (_firstTime) AdvantagePage()];
    notifyListeners();
  }

  void pushSignUp() {
    print(stack);
    stack = [...stack, SignUpPage()];
    notifyListeners();
  }

  void pushResetPass() {
    stack = [...stack, ForgotPassPage()];
    notifyListeners();
  }

  void pushChallengePage(String id) {
    challengeId = id;
    stack = [...stack, ChallengePage(challengeId: id)];
    notifyListeners();
  }

  void pushTaskPage(String id) {
    taskId = id;
    stack = [...stack, TaskPage(taskId: id)];
    notifyListeners();
  }

  void pushConfirmPass() {
    stack = [...stack, ConfirmPassPage()];
    notifyListeners();
  }

  void pushProfile() {
    stack = [...stack, ProfilePage()];
    notifyListeners();
  }
}
