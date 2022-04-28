import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yobit/core/data/preferences.dart';
import 'package:yobit/router/pages/advantage.page.dart';
import 'package:yobit/router/pages/challenge.page.dart';
import 'package:yobit/router/pages/confirm.pass.page.dart';
import 'package:yobit/router/pages/file.preview.page.dart';
import 'package:yobit/router/pages/forgotpass.page.dart';
import 'package:yobit/router/pages/home.page.dart';
import 'package:yobit/router/pages/login.page.dart';
import 'package:yobit/router/pages/profile.page.dart';
import 'package:yobit/router/pages/signup.page.dart';
import 'package:yobit/router/pages/splash.page.dart';
import 'package:yobit/router/pages/task.page.dart';
import 'package:yobit/router/pages/upload.page.dart';
import 'package:yobit/task/data/task.dart';

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
      // UploadPage(Task(
      //     'yNj6o1zx2j0XDKzbCcqk',
      //     "als jflsakdj falsdkjf ",
      //     'slkdjfaldskf jas;ldkf jasdf ',
      //     Timestamp.fromDate(DateTime.now()),
      //     Timestamp.fromDate(DateTime.now()),
      //     'ygdJpKZvXzPpiapjOtPg',
      //     1))
      // ProfilePage()
    ];
    notifyListeners();
  }

  void onLogout() {
    loggedIn = false;
    stack = [
      LoginPage(),
      // if (_firstTime)
      AdvantagePage()
    ];
    notifyListeners();
  }

  void pushFilePreview(String filepath, Uint8List imgData) {
    stack = [...stack, FilePreviewPage(imgData, filepath)];
    notifyListeners();
  }

  void pushSignUp() {
    print(stack);
    stack = [...stack, SignUpPage()];
    notifyListeners();
  }

  void pushUpload(Task task) {
    stack = [...stack, UploadPage(task)];
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

  void pushChallengeFromUpload(String challengeId) {
    stack = [HomePage()];
    pushChallengePage(challengeId);
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
