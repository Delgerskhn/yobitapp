import 'package:flutter/material.dart';
import 'package:yobit/ui/screens/challenge.dart';
import 'package:yobit/ui/screens/challengeDetails.dart';
import 'package:yobit/ui/screens/home.dart';

class ChallengeDetailsPage extends Page {
  ChallengeDetailsPage() : super(key: ValueKey('ChallengePage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return ChallengeDetailsScreen();
      },
    );
  }
}
