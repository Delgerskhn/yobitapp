import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/challenge/ui/widget/detail/challenge.tasks.dart';
import 'package:yobit/profile/api/getUpcomingTasks.dart';
import 'package:yobit/task/data/task.dart';

class UpcomingTasks extends StatelessWidget {
  const UpcomingTasks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUpcomingTasks(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          if (!snapshot.hasData)
            return CircularProgressIndicator().box.alignCenter.make();
          var tasks = snapshot.data as List<Task>;
          return VStack(tasks.map((e) => ChallengeTask(task: e)).toList());
        });
  }
}
