import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/challenge/data/challenge.dart';
import 'package:yobit/utils/hex.color.dart';

class HChallengeCard extends StatelessWidget {
  const HChallengeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var challenge = context.watch<Challenge?>();
    return ZStack(
      [
        HStack(
          [
            (challenge?.title ?? '')
                .text
                .white
                .size(24)
                .bold
                .make()
                .box
                .width(167)
                .px16
                .make()
                .box
                .py24
                .make(),
            VxBox(child: SizedBox())
                .size(178, 180)
                .bgImage(DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(challenge?.planet ?? "")))
                .make(),
          ],
          crossAlignment: CrossAxisAlignment.start,
        ),
        VxBox(child: SizedBox())
            .color(Color.fromRGBO(0, 0, 0, 0.13))
            .size(90, 95)
            .transform(Matrix4.translationValues(0, 85, 0))
            .customRounded(BorderRadius.only(
                topRight: Radius.circular(25), bottomLeft: Radius.circular(25)))
            .make()
      ],
    )
        .box
        .width(345)
        .customRounded(BorderRadius.circular(25))
        .color(HexColor.fromHex(challenge?.color ?? '000000'))
        .make();
  }
}
