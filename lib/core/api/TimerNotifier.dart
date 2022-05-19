import 'dart:async';

import 'package:flutter/foundation.dart';

class ElapsedSecondNotifier extends ChangeNotifier {
  late Timer timer;

  get dateAfterSecond => DateTime.now();

  ElapsedSecondNotifier() {
    this.timer = Timer.periodic(Duration(seconds: 1), (timer) {
      notifyListeners();
    });
  }

  @mustCallSuper
  void dispose() {
    print('timer disposed');
    timer.cancel();
    super.dispose();
  }
}
