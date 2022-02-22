import 'package:flutter/material.dart';
import 'package:yobit/challenge/ui/challenge.screen.dart';

class ChallengePage extends Page {
  ChallengePage() : super(key: ValueKey('ChallengePage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return ChallengeScreen();
      },
    );
  }
}
