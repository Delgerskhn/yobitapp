import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/challenge/api/challenge.repository.dart';
import 'package:yobit/challenge/data/challenge.dart';
import 'package:yobit/core/styles/button.style.dart';
import 'package:yobit/core/ui/elements/btn.icon.dart';

import './challenge.ruby.dart';
import './challenge.sponser.dart';
import 'hchallenge.card.dart';

class ChallengeInfo extends StatelessWidget {
  final ChallengeRepository challengeRepo;
  const ChallengeInfo({Key? key, required this.challengeRepo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var challenge = Provider.of<Challenge?>(context);
    return Container(
      child: Column(
        children: [
          HChallengeCard(),
          ChallengeRuby().box.py32.make(),
          ChallengeSponser(),
          HStack([
            BtnIcon(
              iconBgColor: Theme.of(context).primaryColor,
              suffixImg: 'assets/icons/Back Icon.png',
              onPress: () {
                Navigator.pop(context);
              },
            ).box.width(59).height(59).make(),
            SizedBox(
              width: 20,
            ),
            ElevatedButton(
              style: primaryButtonStyle(context),
              onPressed: () {
                this.challengeRepo.joinChallenge(challenge!.id);
              },
              child: Text('Оролцох'),
            ).box.width(250).height(59).make()
          ]).py24()
        ],
      ),
    );
  }
}
