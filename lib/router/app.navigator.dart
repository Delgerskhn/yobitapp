import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/logic/view_models/auth.view.model.dart';
import 'package:yobit/ui/screens/forgotpass.dart';
import 'package:yobit/ui/screens/home.dart';
import 'package:yobit/ui/screens/signin.dart';
import 'package:yobit/ui/screens/signup.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authmodel = Provider.of<AuthViewModel>(context);
    return MaterialApp.router(
      theme: Theme.of(context).copyWith(
          primaryColor: Color(0xffE85937),
          colorScheme: ColorScheme(
              primary: Color(0xffE85937), //orange
              primaryVariant: Color(0xff623A42), //red light
              secondary: Color(0xffFF464F), //red
              secondaryVariant: Color(0xff623A42), //red light
              onSecondary: Color(0xffFFC542), //yellow
              onSurface: Color(0xff3ED598), //green
              onBackground: Colors.black45,
              onError: Color(0xffFF464F),
              brightness: Brightness.dark,
              background: Colors.black45,
              error: Color(0xffFF464F), //red
              onPrimary: Color(0xffE85937),
              surface: Color(0xff3ED598))),
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(routes: {
        '/': (uri, params) {
          //TODO: Fix Error: Looking up a deactivated widget's ancestor is unsafe. on authmodel loggedin changes
          if (authmodel.loggedIn) return VxRoutePage(child: HomeScreen());
          return VxRoutePage(child: SignInScreen());
        },
        '/login': (uri, params) => VxRoutePage(child: SignInScreen()),
        '/signup': (uri, params) => VxRoutePage(child: SignUpScreen()),
        '/forgotpassword': (uri, params) => VxRoutePage(child: ForgotPass()),
      }, observers: []),
      title: "Yobit",
    );
  }
}
