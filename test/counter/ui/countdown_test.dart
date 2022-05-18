import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/challenge/ui/widget/detail/challenge.details.time.dart';
import 'package:yobit/core/api/TimerNotifier.dart';
import 'package:yobit/core/api/counter.dart';

var now = DateTime.now();

class MockElapsedSecondNotifier extends ElapsedSecondNotifier {
  @override
  get dateAfterSecond => now.add(Duration(seconds: 1));
}

void main() {
  testWidgets('Should update time after count down',
      (WidgetTester tester) async {
    //given
    var enddate = now.add(Duration(seconds: 5));
    var secondNotifier = MockElapsedSecondNotifier();
    var diff = enddate.difference(now);

    var secondCounter =
        SecondCounter(Timestamp.fromDate(enddate), secondNotifier);

    await tester.pumpWidget(MaterialApp(
      home: VxBox(
        child: ChallengeDetailsTime(
            type: TimerType.inSeconds, counter: secondCounter),
      ).size(1000, 1000).make(),
    ));
    expect(find.bySemanticsLabel('${secondCounter.seconds}'), findsWidgets);

    //act
    secondNotifier.notifyListeners();
    await tester.pump();

    //assert
    expect(find.bySemanticsLabel('${secondCounter.seconds}'), findsWidgets);
  });
}
