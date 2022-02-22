import 'package:flutter/cupertino.dart';
import 'package:yobit/auth/ui/form/signup.form.dart';
import 'package:yobit/core/ui/background/earth.background.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EarthBackground(child: () => SignUpForm());
  }
}
