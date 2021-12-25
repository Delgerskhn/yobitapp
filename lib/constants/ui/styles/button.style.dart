import 'package:flutter/material.dart';

ButtonStyle primaryButtonStyle(context) {
  return ElevatedButton.styleFrom(
      textStyle: TextStyle(
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      primary: Theme.of(context).primaryColor,
      onPrimary: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20));
}

ButtonStyle textButtonStyle(context) {
  return TextButton.styleFrom(
    textStyle: TextStyle(color: Colors.white, fontSize: 12),
    primary: Colors.white,
  );
}
