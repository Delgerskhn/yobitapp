import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/challenge/api/challenge.repository.dart';
import 'package:yobit/challenge/ui/widget/detail/challenge.tasks.dart';
import 'package:yobit/router/navigation.model.dart';
import 'package:yobit/task/api/task.repo.dart';
import 'package:yobit/task/data/task.dart';

class TaskContainer extends StatefulWidget {
  final ChallengeRepository challengeRepo;
  final ITaskRepository taskRepo;

  const TaskContainer(
      {Key? key, required this.challengeRepo, required this.taskRepo})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _TaskContainer();
  }
}

class _TaskContainer extends State<TaskContainer> {
  @override
  Widget build(BuildContext context) {
    var navmodel = Provider.of<NavigationModel>(context);
    return FutureBuilder(
        future: this.widget.taskRepo.getChallengeTasks(navmodel.challengeId!),
        builder: (ctx, scaffold) {
          if (scaffold.connectionState == ConnectionState.done) {
            if (scaffold.hasData) {
              var tasks = scaffold.data as List<Task>;
              return Column(
                children: tasks.map((e) => ChallengeTask(task: e)).toList(),
              );
            }
            if (scaffold.hasError) {
              print(scaffold.error);
              return Text('An error occured!');
            }
          }
          return CircularProgressIndicator().box.alignCenter.make();
        });
  }
}
