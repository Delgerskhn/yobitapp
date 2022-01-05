import 'package:flutter/material.dart';
import 'package:yobit/router/pages/home.page.dart';
import 'package:yobit/router/pages/login.page.dart';
import 'package:yobit/router/pages/signup.page.dart';
import 'package:yobit/router/pages/splash.page.dart';

List<Page> splashStack() =>
    [SplashPage(process: 'Splash Screen:\n\nChecking auth state')];

List<Page> loggedOutStack(isSigningIn) =>
    [LoginPage(), if (isSigningIn) SignUpPage()];

List<Page> loggedInStack() {
  return [
    HomePage(),
    //TODO:  Door page ee uusgecheed nemch ogonguut login hiisnii daraa shuud haragdah ystoi
    //ChallengePage()
  ];
}
