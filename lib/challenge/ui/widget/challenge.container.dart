import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/challenge/api/challenge.repository.dart';
import 'package:yobit/challenge/data/challenge.dart';
import 'package:yobit/challenge/ui/widget/vchallenge.card.dart';

class ChallengeContainer extends StatefulWidget {
  final ChallengeRepository challengeRepo;

  const ChallengeContainer({Key? key, required this.challengeRepo})
      : super(key: key);
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
        if (snapshot.hasError) print(snapshot.error);
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          var source = snapshot.data as List<Challenge>;
          int mid = (source.length / 2).toInt();
          List<Challenge> col1 = source.sublist(0, mid);
          List<Challenge> col2 = source.sublist(mid, source.length);
          return HStack(
            [
              VStack(col1.map((r) => VChallengeCard(challenge: r)).toList()),
              VxBox().margin(Vx.m12).make(),
              VStack(col2.map((r) => VChallengeCard(challenge: r)).toList())
            ],
            alignment: MainAxisAlignment.center,
            crossAlignment: CrossAxisAlignment.start,
          ).wFull(context).box.margin(EdgeInsets.only(top: Vx.m64.top)).make();
        }
        return CircularProgressIndicator()
            .box
            .margin(EdgeInsets.only(top: Vx.m64.top))
            .alignCenter
            .make();
      },
      future: this.widget.challengeRepo.getRegularChallenges(),
    );
  }
}
