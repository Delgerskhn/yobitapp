import 'package:flutter/material.dart';
import 'package:yobit/router/pages/home.page.dart';
import 'package:yobit/router/pages/login.page.dart';
import 'package:yobit/router/pages/splash.page.dart';
import 'package:yobit/services/auth.repository.dart';

class AppRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  bool? _loggedIn;
  bool? get loggedIn => _loggedIn;
  set loggedIn(value) {
    _loggedIn = value;
    notifyListeners();
  }

  String? _selectedColorCode;
  String? get selectedColorCode => _selectedColorCode;
  set selectedColorCode(String? value) {
    _selectedColorCode = value;
    notifyListeners();
  }

  final AuthRepository authRepository;

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  AppRouterDelegate(this.authRepository) {
    _init();
  }

  _init() async {
    loggedIn = await authRepository.isUserLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    List<Page> stack;
    if (loggedIn == null) {
      stack = _splashStack;
    } else if (loggedIn!) {
      stack = _loggedInStack;
    } else {
      stack = _loggedOutStack;
    }
    return Navigator(
      key: navigatorKey,
      pages: stack,
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        selectedColorCode = null;
        return true;
      },
    );
  }

  List<Page> get _splashStack =>
      [SplashPage(process: 'Splash Screen:\n\nChecking auth state')];

  List<Page> get _loggedOutStack => [
        LoginPage(onLogin: () {
          loggedIn = true;
        })
      ];

  List<Page> get _loggedInStack {
    final onLogout = () {
      loggedIn = false;
      _clear();
    };
    final selectedColorCode = this.selectedColorCode;
    return [
      HomePage(
        onColorTap: (String colorCode) {
          this.selectedColorCode = colorCode;
        },
        onLogout: onLogout,
      ),
      // if (selectedColorCode != null)
      //   ColorPage(
      //     selectedColorCode: selectedColorCode,
      //     onShapeTap: (ShapeBorderType shapeBorderType) {
      //       this.selectedShapeBorderType = shapeBorderType;
      //     },
      //     onLogout: onLogout,
      //   ),
      // if (selectedColorCode != null && selectedShapeBorderType != null)
      //   ShapePage(
      //     colorCode: selectedColorCode,
      //     shapeBorderType: selectedShapeBorderType,
      //     onLogout: onLogout,
      //   )
    ];
  }

  _clear() {
    selectedColorCode = null;
  }

  @override
  Future<void> setNewRoutePath(configuration) async {/* Do Nothing */}
}
