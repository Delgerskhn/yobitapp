import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

enum TimerType { inSeconds, inMinutes }

class ChallengeDetailsTime extends StatefulWidget {
  final Timestamp endDate;
  final TimerType type;
  const ChallengeDetailsTime({
    Key? key,
    required this.endDate,
    required this.type,
  }) : super(key: key);

  @override
  State<ChallengeDetailsTime> createState() => _ChallengeDetailsTimeState();
}

class _ChallengeDetailsTimeState extends State<ChallengeDetailsTime> {
  late Timestamp endDate;
  late Timer timer;
  int? days;
  int? hours;
  int? minutes;
  int? seconds;
  @override
  void initState() {
    super.initState();
    endDate = this.widget.endDate;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      var d = DateTime.now();
      var e = endDate.toDate();
      var diff = e.difference(d);
      if (this.mounted)
        setState(() {
          days = diff.inDays;
          if (this.widget.type == TimerType.inSeconds)
            hours = diff.inHours;
          else
            hours = diff.inHours - diff.inDays * 24;
          minutes = diff.inMinutes - diff.inHours * 60;
          seconds = diff.inSeconds - diff.inMinutes * 60;
        });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return VxContinuousRectangle(
      radius: 12,
      child: VStack(
        [
          [
            if (this.widget.type == TimerType.inMinutes)
              "${this.days ?? '0'} өдөр",
            "${this.hours} цаг",
            "${this.minutes} мин",
            if (this.widget.type == TimerType.inSeconds) "${this.seconds} сек"
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
