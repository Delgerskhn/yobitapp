import 'package:flutter/material.dart';
import 'package:yobit/services/auth.repository.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository authRepository;
  bool logingIn = false;
  bool logingOut = false;

  AuthViewModel(this.authRepository);

  Future<bool> login(email, password) async {
    logingIn = true;
    notifyListeners();
    final result = await authRepository.login(email, password);
    logingIn = false;
    notifyListeners();
    return result;
  }

  Future<bool> signup(email, name, password) async {
    final result = await authRepository.register(email, password);
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
