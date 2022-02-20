import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yobit/router/pages/challenge.page.dart';
import 'package:yobit/router/pages/forgotpass.page.dart';
import 'package:yobit/router/pages/home.page.dart';
import 'package:yobit/router/pages/login.page.dart';
import 'package:yobit/router/pages/signup.page.dart';
import 'package:yobit/router/pages/splash.page.dart';
import 'package:yobit/services/auth.repository.dart';

class NavigationModel extends ChangeNotifier {
  bool? _loggedIn;
  bool _isSigninIn = false;
  bool _isResettingPass = false;

  String? challengeId;
  String? taskId;

  bool? get loggedIn => _loggedIn;

  bool onPopPage(route, result) {
    if (!route.didPop(result)) return false;
    if (_isSigninIn) _isSigninIn = false;
    if (_isResettingPass) _isResettingPass = false;
    if (challengeId != null && taskId == null) challengeId = null;
    if (challengeId != null && taskId != null) taskId = null;
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

  List<Page> stack = [
    SplashPage(process: 'Splash Screen:\n\nChecking auth state')
  ];

  void onLogin() {
    loggedIn = true;
    stack = [
      HomePage(),
      if (challengeId != null) ChallengePage(),
      // if(taskId !=null) TaskPage(),
    ];
    notifyListeners();
  }

  void onLogout() {
    loggedIn = false;
    stack = [
      LoginPage(),
      if (_isSigninIn) SignUpPage(),
      if (_isResettingPass) ForgotPassPage()
    ];
    notifyListeners();
  }

  void pushSignUp() {
    _isSigninIn = true;
    onLogout();
    notifyListeners();
  }

  void pushResetPass() {
    _isResettingPass = true;
    onLogout();
    notifyListeners();
  }

  void pushChallengePage(String id) {
    challengeId = id;
    onLogin();
    notifyListeners();
  }
}
