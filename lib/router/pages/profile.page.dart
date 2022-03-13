import 'package:flutter/material.dart';
import 'package:yobit/profile/ui/profile.dart';

class ProfilePage extends Page {
  ProfilePage() : super(key: ValueKey('ProfilePage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return ProfileScreen();
      },
    );
  }
}
