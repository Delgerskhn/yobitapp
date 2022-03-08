import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yobit/router/pages/advantage.page.dart';
import 'package:yobit/router/pages/challenge.page.dart';
import 'package:yobit/router/pages/confirm.pass.page.dart';
import 'package:yobit/router/pages/forgotpass.page.dart';
import 'package:yobit/router/pages/home.page.dart';
import 'package:yobit/router/pages/login.page.dart';
import 'package:yobit/router/pages/signup.page.dart';
import 'package:yobit/router/pages/splash.page.dart';
import 'package:yobit/router/pages/task.page.dart';

class NavigationModel extends ChangeNotifier {
  bool? _loggedIn;
  bool _isSigninIn = false;
  bool _isResettingPass = false;

  String? challengeId;
  String? taskId;

  bool _isConfirmingPass = false;

  bool? get loggedIn => _loggedIn;

  bool onPopPage(route, result) {
    if (!route.didPop(result)) return false;
    if (_isSigninIn) _isSigninIn = false;
    if (_isResettingPass) _isResettingPass = false;
    if (_isConfirmingPass) _isConfirmingPass = false;
    if (challengeId != null && taskId == null) challengeId = null;
    if (challengeId != null && taskId != null) taskId = null;
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
    FirebaseAuth.instance.authStateChanges().listen((user) {
      loggedIn = user != null;
      if (loggedIn!)
        onLogin();
      else
        onLogout();
    });
  }

  List<Page> stack = [
    SplashPage(process: 'Splash Screen:\n\nChecking auth state')
  ];

  void onLogin() {
    loggedIn = true;
    stack = [
      HomePage(),
      if (challengeId != null) ChallengePage(challengeId: challengeId!),
      if (taskId != null) TaskPage(taskId: taskId!),
    ];
    notifyListeners();
  }

  void onLogout() {
    loggedIn = false;
    stack = [
      LoginPage(),
      if (_isSigninIn) SignUpPage(),
      if (_isResettingPass) ForgotPassPage(),
      AdvantagePage()
      // if (_isConfirmingPass)
      // ConfirmPassPage()
    ];
    notifyListeners();
  }

  void pushSignUp() {
    _isSigninIn = true;
    onLogout();
  }

  void pushResetPass() {
    _isResettingPass = true;
    onLogout();
  }

  void pushChallengePage(String id) {
    challengeId = id;
    onLogin();
  }

  void pushTaskPage(String id) {
    taskId = id;
    onLogin();
  }

  void pushConfirmPass() {
    _isConfirmingPass = true;
    onLogout();
  }
}
