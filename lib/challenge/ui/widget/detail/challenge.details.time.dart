import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/core/api/TimerNotifier.dart';
import 'package:yobit/core/api/counter.dart';

enum TimerType { inSeconds, inMinutes }

class ChallengeDetailsTime extends StatefulWidget {
  final Counter counter;
  final TimerType type;
  const ChallengeDetailsTime({
    Key? key,
    required this.type,
    required this.counter,
  }) : super(key: key);

  @override
  State<ChallengeDetailsTime> createState() =>
      _ChallengeDetailsTimeState(counter);
}

class _ChallengeDetailsTimeState extends State<ChallengeDetailsTime> {
  final Counter counter;

  @override
  void dispose() {
    this.widget.counter.dispose();
    super.dispose();
  }

  _ChallengeDetailsTimeState(this.counter);
  @override
  void initState() {
    super.initState();
    this.widget.counter.addListener(() {
      print('elapsed seconds: ${this.widget.counter.seconds}');
      if (this.mounted) this.setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return VxContinuousRectangle(
      radius: 12,
      child: VStack(
        [
          [
            if (this.widget.type == TimerType.inMinutes)
              "${this.counter.days} өдөр",
            "${this.counter.hours} цаг",
            "${this.counter.minutes} мин",
            if (this.widget.type == TimerType.inSeconds)
              "${this.counter.seconds} сек"
          ].join(' : ').text.white.bold.headline6(context).make(),
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
