import 'package:flutter/cupertino.dart';
import 'package:yobit/ui/widgets/forms/signup.form.dart';
import 'package:yobit/ui/widgets/static/earth.background.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EarthBackground(child: () => SignUpForm());
  }
}
