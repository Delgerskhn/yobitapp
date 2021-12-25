import 'package:flutter/material.dart';
import 'package:yobit/ui/screens/signin.dart';

class LoginPage extends Page {
  final VoidCallback onLogin;

  LoginPage({required this.onLogin}) : super(key: ValueKey('LoginPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => SignInScreen(onLogin: onLogin),
    );
  }
}
