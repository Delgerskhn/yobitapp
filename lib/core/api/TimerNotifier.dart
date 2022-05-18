import 'dart:async';

import 'package:flutter/foundation.dart';

class ElapsedSecondNotifier extends ChangeNotifier {
  late Timer timer;

  get dateAfterSecond => DateTime.now();

  TimerNotifier() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print('time added by 1');
      notifyListeners();
    });
  }

  @mustCallSuper
  void dispose() {
    super.dispose();
    timer.cancel();
  }
}
