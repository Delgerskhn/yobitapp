import 'package:flutter/material.dart';
import 'package:yobit/router/pages/home.page.dart';
import 'package:yobit/router/pages/login.page.dart';
import 'package:yobit/router/pages/splash.page.dart';

List<Page> splashStack() =>
    [SplashPage(process: 'Splash Screen:\n\nChecking auth state')];

List<Page> loggedOutStack() => [LoginPage()];

List<Page> loggedInStack() {
  return [
    HomePage(),
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
