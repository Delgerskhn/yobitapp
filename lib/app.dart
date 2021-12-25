import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yobit/constants/infrastructure/routes.dart';
import 'package:yobit/logic/navigation.controller.dart';
import 'package:yobit/ui/screens/home.dart';
import 'package:yobit/ui/screens/notfound.dart';
import 'package:yobit/ui/screens/signin.dart';
import 'package:yobit/ui/screens/signup.dart';
import 'package:yobit/logic/view_models/user.view.model.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navController = Provider.of<NavigationController>(context);

    return MaterialApp(
      title: 'Yobit',
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
      home: Navigator(
        //it is the screen stack and you can modify it easily
        pages: [
          // if (navController.screenName == Routes.Home)
          //   MaterialPage(child: HomeScreen()),
          // if (navController.screenName == Routes.SignIn)
          MaterialPage(child: SignInScreen()),
          // if (navController.screenName == Routes.SignUp)
          //   MaterialPage(child: SignUpScreen())
        ],
        onPopPage: (route, result) {
          bool status = route.didPop(result);
          if (status) navController.changeScreen('/');
          return status;
        },
      ),

      // routes: routes(),
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (_) => NotFound());
      // },
    );
  }
}
