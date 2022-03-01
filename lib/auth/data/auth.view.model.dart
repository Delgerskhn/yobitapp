import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yobit/core/errors/autherror.dart';

class AuthViewModel extends ChangeNotifier {
  final BuildContext context;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;
  bool loggedIn = false;

  AuthViewModel(this.context) {
    auth.authStateChanges().listen((user) {
      loggedIn = user != null;
      notifyListeners();
    });
  }

  void login(email, password) {
    loading = true;
    notifyListeners();
    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      loggedIn = true;
    }).catchError((err) {
      handleAuthError(context, err);
    }).whenComplete(() {
      loading = false;
      notifyListeners();
    });
  }

  void sendPasswordResetEmail(email) {
    loading = true;
    notifyListeners();
    auth.sendPasswordResetEmail(email: email).catchError((err) {
      handleAuthError(context, err);
    }).whenComplete(() {
      loading = false;
      notifyListeners();
    });
  }

  void confirmPasswordReset(code, newPass) {
    loading = true;
    notifyListeners();
    auth
        .confirmPasswordReset(code: code, newPassword: newPass)
        .catchError((err) {
      handleAuthError(context, err);
    }).whenComplete(() {
      loading = false;
      notifyListeners();
    });
  }

  void signup(email, name, password) {
    loading = true;
    notifyListeners();
    auth.authStateChanges().listen((user) {
      if (user != null) user.updateDisplayName(name);
    });
    auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {})
        .catchError((err) {
      handleAuthError(context, err);
    }).whenComplete(() {
      loading = false;
      notifyListeners();
    });
  }

  void logout() {
    loading = true;
    notifyListeners();
    auth.signOut().catchError((err) {
      handleAuthError(context, err);
    }).whenComplete(() {
      loading = false;
      loggedIn = false;
      notifyListeners();
    });
  }
}
