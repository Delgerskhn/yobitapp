import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Stats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        HStack(
          ['Weekly'.text.make()],
          alignment: MainAxisAlignment.end,
          axisSize: MainAxisSize.max,
        ),
        'Энэ долоо хоногт та  10 даалгаварт оролцов.'
            .text
            .medium
            .align(TextAlign.center)
            .white
            .make()
            .box
            .width(200)
            .make(),
        CircularProgressIndicator(value: 0.7).box.size(148, 148).make(),
        HStack([
          'Weekly total challenges'.text.make(),
          'Weekly total tasks'.text.make(),
        ])
      ],
      alignment: MainAxisAlignment.center,
    )
        .p16()
        .box
        .color(Color(0xff3DD598))
        .customRounded(BorderRadius.circular(20))
        .make();
  }
}
