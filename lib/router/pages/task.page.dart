import 'package:flutter/material.dart';
import 'package:yobit/challenge/ui/challenge.screen.dart';
import 'package:yobit/task/ui/task.screen.dart';

class TaskPage extends Page {
  final String taskId;

  TaskPage({required this.taskId}) : super(key: ValueKey('TaskPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return TaskScreen();
      },
    );
  }
}
