import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class UserGadget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserGadget();
}

class _UserGadget extends State<UserGadget> {
  @override
  Widget build(BuildContext context) {
    return HStack(
      [
        Container(
            width: 57,
            height: 20,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: HStack(
              [
                '1700'
                    .text
                    .fontWeight(FontWeight.bold)
                    .size(9)
                    .color(Colors.white)
                    .make(),
                Image.asset('assets/icons/coin 1.png')
                    .box
                    .margin(EdgeInsets.only(left: 2))
                    .size(14, 19)
                    .make()
              ],
              crossAlignment: CrossAxisAlignment.center,
            ).p(4)),
        Image.asset('assets/images/profile.png')
            .box
            .transform(Matrix4.translationValues(-10, 0, 0))
            .make(),
      ],
    );
  }
}
