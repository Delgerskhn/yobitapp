import 'package:flutter/material.dart';
import 'package:yobit/upload/ui/upload.screen.dart';

class UploadPage extends Page {
  UploadPage() : super(key: ValueKey('UploadPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return UploadScreen();
      },
    );
  }
}
