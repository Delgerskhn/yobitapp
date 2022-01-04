import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yobit/router/navigation.model.dart';

class AppRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  AppRouterDelegate();

  @override
  Widget build(BuildContext context) {
    var navmodel = Provider.of<NavigationModel>(context);
    return Navigator(
      key: navigatorKey,
      pages: navmodel.stack,
      onPopPage: navmodel.onPopPage,
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) async {/* Do Nothing */}
}
