import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/constants/infrastructure/paths.dart';

class ChallengeContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChallengeContainerState();
  }
}

class _ChallengeContainerState extends State<ChallengeContainer> {
  var challenges = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return VStack(challenges
        .map((e) => VxBox(
              child: Image.asset(
                Paths.specialChallenge,
                fit: BoxFit.cover,
              ),
            ).make())
        .toList());
  }
}
