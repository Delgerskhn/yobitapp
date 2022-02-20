import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/constants/infrastructure/paths.dart';
import 'package:yobit/ui/widgets/challenge/challenge.card.dart';

class ChallengeContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChallengeContainerState();
  }
}

class _ChallengeContainerState extends State<ChallengeContainer> {
  List<List<int>> challenges = [
    [1, 2],
    [3, 4],
    [5]
  ];

  @override
  Widget build(BuildContext context) {
    return VStack(
      challenges
          .map((pair) => HStack([
                ChallengeCard(),
                VxBox().margin(Vx.m12).padding(Vx.m2).make(),
                ChallengeCard()
              ]))
          .toList(),
      crossAlignment: CrossAxisAlignment.center,
    ).wFull(context);
  }
}
