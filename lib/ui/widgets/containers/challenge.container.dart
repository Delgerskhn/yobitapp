import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/constants/infrastructure/paths.dart';
import 'package:yobit/logic/models/challenge.dart';
import 'package:yobit/services/challenge.repository.dart';
import 'package:yobit/ui/widgets/challenge/challenge.card.dart';

class ChallengeContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChallengeContainerState();
  }
}

class _ChallengeContainerState extends State<ChallengeContainer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          var source = snapshot.data as List<Challenge>;
          List<List<Challenge>> challenges = [];
          for (var i = 0; i < source.length; i += 2) {
            challenges
                .add([source[i], if (i + 1 < source.length) source[i + 1]]);
          }
          return VStack(
            challenges
                .map((pair) => HStack(
                      [
                        ChallengeCard(
                          challenge: pair[0],
                        ),
                        VxBox().margin(Vx.m12).padding(Vx.m2).make(),
                        if (pair.length == 1)
                          Spacer()
                        else
                          ChallengeCard(
                            challenge: pair[1],
                          )
                      ],
                      alignment: MainAxisAlignment.spaceBetween,
                    ))
                .toList(),
            crossAlignment: CrossAxisAlignment.center,
          ).wFull(context);
        }
        return CircularProgressIndicator();
      },
      future: getRegularChallenges(),
    );
    // VStack(
    //   challenges
    //       .map((pair) => HStack([
    //             ChallengeCard(),
    //             VxBox().margin(Vx.m12).padding(Vx.m2).make(),
    //             ChallengeCard()
    //           ]))
    //       .toList(),
    //   crossAlignment: CrossAxisAlignment.center,
    // ).wFull(context);
  }
}
