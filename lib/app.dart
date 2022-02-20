import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yobit/router/navigation.model.dart';
import 'package:yobit/router/approuter.delegate.dart';
import 'package:yobit/services/auth.repository.dart';
import 'package:yobit/services/preference.dart';

import 'logic/view_models/auth.view.model.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late AuthRepository authRepository;
  late AppRouterDelegate delegate;

  @override
  void initState() {
    super.initState();
    authRepository = AuthRepository(Preference());
    delegate = AppRouterDelegate();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<NavigationModel>(
              create: (_) => NavigationModel(authRepository)),
          ChangeNotifierProvider<AuthViewModel>(
              create: (_) => AuthViewModel(authRepository)),
        ],
        child: MaterialApp(
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
          home: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Router(
                  routerDelegate: delegate,
                  backButtonDispatcher: RootBackButtonDispatcher())),
        ));
  }
}
