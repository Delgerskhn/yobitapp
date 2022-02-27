import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yobit/auth/api/auth.repository.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository authRepository;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool logingIn = false;
  bool logingOut = false;
  bool loggedIn = false;

  AuthViewModel(this.authRepository) {
    auth.authStateChanges().listen((user) {
      loggedIn = user != null;
      notifyListeners();
    });
  }

  Future<bool> login(email, password) async {
    logingIn = true;
    notifyListeners();
    final result = await authRepository.login(email, password);
    logingIn = false;
    notifyListeners();
    return result;
  }

  Future<bool> resetPass(email) async {
    return await authRepository.resetPass(email);
  }

  Future<bool> signup(email, name, password) async {
    final result = await authRepository.register(email, name, password);
    notifyListeners();
    return result;
  }

  Future<bool> logout() async {
    logingOut = true;
    notifyListeners();
    final logoutResult = await authRepository.logout();
    logingOut = false;
    notifyListeners();
    return logoutResult;
  }
}
