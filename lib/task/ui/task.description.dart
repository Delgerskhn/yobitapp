import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/task/data/task.dart';

class TaskDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var task = context.watch<Task?>();
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
          '${task?.title ?? ''}'.text.wrapWords(true).white.bold.make()
        ],
        axisSize: MainAxisSize.max,
      ),
      SizedBox(
        height: 15,
      ),
      '${task?.content ?? ''}'.text.wrapWords(true).white.make()
    ])
        .box
        .margin(Vx.mH32)
        .p24
        .color(Theme.of(context).colorScheme.secondary)
        .customRounded(BorderRadius.circular(25))
        .make();
  }
}
