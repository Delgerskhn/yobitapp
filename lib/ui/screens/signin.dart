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
