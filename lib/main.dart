import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yobit/logic/navigation.controller.dart';
import 'package:yobit/logic/view_models/user.view.model.dart';

import 'app.dart';

void main() {
  runApp(MultiProvider(providers: [
    ListenableProvider(create: (_) => NavigationController()),
    ListenableProvider(create: (_) => UserViewModel())
  ], child: App()));
}
