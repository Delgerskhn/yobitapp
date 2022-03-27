import 'package:flutter/material.dart';
import 'package:yobit/task/data/task.dart';
import 'package:yobit/upload/ui/upload.screen.dart';

class UploadPage extends Page {
  final Task task;
  UploadPage(this.task) : super(key: ValueKey('UploadPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return UploadScreen(
          task: task,
        );
      },
    );
  }
}
