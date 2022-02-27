import 'package:flutter/material.dart';

class ToasterModel extends ChangeNotifier {
  String? errorMsg;
  void showError(String msg) {
    this.errorMsg = msg;
    notifyListeners();
  }
}
