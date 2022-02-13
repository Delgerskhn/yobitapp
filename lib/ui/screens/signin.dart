import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yobit/ui/widgets/forms/signin.form.dart';
import 'package:yobit/ui/widgets/static/earth.background.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen();

  @override
  Widget build(BuildContext context) {
    return EarthBackground(child: () => SignInForm());
  }
}
