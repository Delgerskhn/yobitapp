//TODO: busad page uudtei adilhanaa uusgesen screenee oruulj irehed bolno
import 'package:flutter/material.dart';
import 'package:yobit/ui/screens/challenge.dart';

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
