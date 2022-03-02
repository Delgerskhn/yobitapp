import 'package:flutter/material.dart';
import 'package:yobit/core/data/globals.dart';

void showError(String message) {
  var snackbar = SnackBar(
    content: Text(
      message,
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Color(0xffFF464F),
  );
  snackbarKey.currentState?.showSnackBar(snackbar);
}
