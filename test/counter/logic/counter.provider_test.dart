import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yobit/core/api/TimerNotifier.dart';
import 'package:yobit/core/api/counter.dart';

var now = DateTime.now();

class MockElapsedSecondNotifier extends ElapsedSecondNotifier {
  @override
  get dateAfterSecond => now.add(Duration(seconds: 1));
}

void main() {
  test('Minute counter should count down on every minute', () async {
    expect(true, false);
  });
  test('Second counter should count down on every second', () async {
    //given

    var enddate = now.add(Duration(seconds: 5));
    var diff = enddate.difference(now);

    var secondNotifier = MockElapsedSecondNotifier();
    var t = Timestamp.fromDate(enddate);
    var counter = SecondCounter(t, secondNotifier);

    //act
    secondNotifier.notifyListeners();

    //assert
    expect(counter.seconds, diff.inSeconds - 1);
  });
  test('Should stop when time overflows right now', () {});
}
