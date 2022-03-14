import 'package:flutter/material.dart';
import 'package:yobit/challenge/api/challenge.repository.dart';
import 'package:yobit/challenge/ui/challenge.screen.dart';

class ChallengePage extends Page {
  final String challengeId;

  ChallengePage({required this.challengeId})
      : super(key: ValueKey('ChallengePage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return ChallengeScreen(
          challengeId: challengeId,
          challengeRepo: ChallengeRepository(),
        );
      },
    );
  }
}
