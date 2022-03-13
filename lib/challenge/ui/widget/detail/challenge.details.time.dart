import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChallengeDetailsTime extends StatelessWidget {
  const ChallengeDetailsTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxContinuousRectangle(
      radius: 12,
      child: VStack(
        [
          "03 өдөр : 12 цаг : 10 мин".text.white.bold.headline6(context).make(),
          SizedBox(
            height: 10,
          ),
          HStack([
            Icon(Icons.circle_outlined, color: Colors.red, size: 20),
            SizedBox(
              width: 12,
            ),
            'Тэмцээн дуусах хугацаа'.text.white.bold.make()
          ])
        ],
        alignment: MainAxisAlignment.end,
      ).p24(),
      backgroundColor: Color(0xff292639),
    ).h(112);
  }
}
