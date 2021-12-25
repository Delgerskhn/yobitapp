import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yobit/constants/infrastructure/ids.dart';
import 'package:yobit/logic/view_models/user.view.model.dart';
import 'package:yobit/ui/widgets/forms/signin.form.dart';
import 'package:yobit/ui/widgets/static/earth.abs.dart';
import 'package:yobit/ui/widgets/static/earth.background.dart';
import 'package:yobit/ui/widgets/static/star.bg.abs.dart';

class SignInScreen extends StatelessWidget {
  final VoidCallback onLogin;

  const SignInScreen({required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return EarthBackground(child: () => SignInForm(onLogin));
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Consumer<UserState>(builder: (_, userState, child) {
  //     return Center(
  //         child: Container(
  //       child: Column(
  //         children: [
  //           ElevatedButton(
  //               key: Key(IDs.SignInScreen),
  //               onPressed: () =>
  //                   userState.setUser(new User(Token('', '', ''), 'deegii')),
  //               child:
  //                   Text(userState.user.fold(() => 'null', (a) => a.userName)))
  //         ],
  //       ),
  //     ));
  //   });
  // }
}
