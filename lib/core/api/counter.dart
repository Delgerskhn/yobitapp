import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yobit/core/api/TimerNotifier.dart';

class Counter extends ChangeNotifier {
  Timestamp endDate;
  ElapsedSecondNotifier secondNotifier;
  int days = 0;
  int hours = 0;
  int minutes = 0;
  int seconds = 0;

  Counter(this.endDate, this.secondNotifier);

  @override
  void dispose() {
    super.dispose();
    secondNotifier.dispose();
  }
}

class SecondCounter extends Counter {
  SecondCounter(Timestamp endDate, ElapsedSecondNotifier secondNotifier)
      : super(endDate, secondNotifier) {
    secondNotifier.addListener(() {
      var d = secondNotifier.dateAfterSecond;
      var e = endDate.toDate();
      var diff = e.difference(d);
      days = diff.inDays;
      hours = diff.inHours;
      minutes = diff.inMinutes - diff.inHours * 60;
      seconds = diff.inSeconds - diff.inMinutes * 60;
      notifyListeners();
    });
  }
}

class MinuteCounter extends Counter {
  MinuteCounter(Timestamp endDate, ElapsedSecondNotifier secondNotifier)
      : super(endDate, secondNotifier) {
    secondNotifier.addListener(() {
      var d = DateTime.now();
      var e = endDate.toDate();
      var diff = e.difference(d);
      days = diff.inDays;
      hours = diff.inHours - diff.inDays * 24;
      minutes = diff.inMinutes - diff.inHours * 60;
      seconds = diff.inSeconds - diff.inMinutes * 60;
      notifyListeners();
    });
  }
}
