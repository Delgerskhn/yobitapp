import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yobit/auth/api/auth.repository.dart';
import 'package:yobit/core/errors/autherror.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository authRepository;
  final BuildContext context;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;
  bool loggedIn = false;

  AuthViewModel(this.authRepository, this.context) {
    auth.authStateChanges().listen((user) {
      loggedIn = user != null;
      notifyListeners();
    });
  }

  void login(email, password) {
    loading = true;
    notifyListeners();
    authRepository.login(email, password).then((value) {
      loggedIn = true;
    }).catchError((err) {
      handleAuthError(context, err);
    }).whenComplete(() {
      loading = false;
      notifyListeners();
    });
  }

  void resetPass(email) {
    loading = true;
    notifyListeners();
    authRepository.resetPass(email).catchError((err) {
      handleAuthError(context, err);
    }).whenComplete(() {
      loading = false;
      notifyListeners();
    });
  }

  void signup(email, name, password) {
    loading = true;
    notifyListeners();
    authRepository
        .register(email, name, password)
        .then((value) {})
        .catchError((err) {
      handleAuthError(context, err);
    }).whenComplete(() {
      loading = false;
      notifyListeners();
    });
  }

  Future<bool> logout() async {
    loading = true;
    notifyListeners();
    final logoutResult = await authRepository.logout();
    loading = false;
    notifyListeners();
    return logoutResult;
  }
}
