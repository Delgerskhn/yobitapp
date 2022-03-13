import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/challenge/data/challenge.dart';

class ChallengeSponser extends StatelessWidget {
  const ChallengeSponser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var challenge = context.watch<Challenge?>();
    return VxContinuousRectangle(
      radius: 16,
      backgroundColor: Theme.of(context).primaryColor,
      child: HStack([
        Image.asset(
          "assets/images/ruby.png",
          width: 90,
        ),
        SizedBox(
          height: 8,
        ),
        VStack([
          'Шагнал'.text.white.size(16).make(),
          '${challenge?.reward ?? ''}'
              .text
              .white
              .wrapWords(true)
              .size(14)
              .make()
              .box
              .width(200)
              .make()
        ])
      ]),
    ).w(345);
  }
}
