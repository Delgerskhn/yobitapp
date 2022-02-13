import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/router/app.navigator.dart';
import 'package:yobit/router/nav.observer.dart';
import 'package:yobit/services/auth.repository.dart';
import 'package:yobit/services/preference.dart';
import 'package:yobit/ui/screens/forgotpass.dart';
import 'package:yobit/ui/screens/home.dart';
import 'package:yobit/ui/screens/signin.dart';
import 'package:yobit/ui/screens/signup.dart';

import 'logic/view_models/auth.view.model.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late AuthRepository authRepository;
  late VxNavigator navigator;

  @override
  void initState() {
    super.initState();
    authRepository = AuthRepository(Preference());
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<AuthViewModel>(
          create: (_) => AuthViewModel(authRepository)),
    ], child: AppNavigator());
  }
}
