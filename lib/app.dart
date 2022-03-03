import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yobit/core/data/globals.dart';
import 'package:yobit/router/navigation.model.dart';
import 'package:yobit/router/approuter.delegate.dart';

import 'auth/data/auth.view.model.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationModel(),
      child: MaterialApp(
        scaffoldMessengerKey: snackbarKey,
        title: 'Yobit',
        theme: Theme.of(context).copyWith(
            primaryColor: Color(0xffE85937),
            colorScheme: ColorScheme(
                primary: Color(0xffE85937), //orange
                secondary: Color(0xffFF464F), //red
                onSecondary: Color(0xffFFC542), //yellow
                onSurface: Color(0xff3ED598), //green
                onBackground: Colors.black45,
                onError: Color(0xffFF464F),
                brightness: Brightness.dark,
                background: Colors.black45,
                error: Color(0xffFF464F), //red
                onPrimary: Color(0xffE85937),
                surface: Color(0xff3ED598))),
        home: ProviderWrapper(),
      ),
    );
  }
}

class ProviderWrapper extends StatelessWidget {
  final AppRouterDelegate delegate = AppRouterDelegate();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(
            create: (_) => AuthViewModel(context)),
      ],
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Router(
              routerDelegate: delegate,
              backButtonDispatcher: RootBackButtonDispatcher())),
    );
  }
}
