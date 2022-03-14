import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TaskDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VStack([
      HStack(
        [
          Icon(
            Icons.stars_rounded,
            size: 44,
            color: Colors.white60,
          ),
          SizedBox(
            width: 20,
          ),
          'Найзтайгаа зураг авхуулах'.text.wrapWords(true).white.bold.make()
        ],
        axisSize: MainAxisSize.max,
      ),
      SizedBox(
        height: 15,
      ),
      'Өнөөдрийн даалгаварт та найзтайгаа цуг зурагаа авхуулах юм.Өнөөдрийн даалгаварт та найзтайгаа цуг зурагаа авхуулах юм.Өнөөдрийн даалгаварт та найзтайгаа цуг зурагаа авхуулах юм.'
          .text
          .wrapWords(true)
          .white
          .make()
    ])
        .box
        .margin(Vx.mH32)
        .p24
        .color(Theme.of(context).colorScheme.secondary)
        .customRounded(BorderRadius.circular(25))
        .make();
  }
}
