import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/challenge/ui/widget/detail/challenge.details.time.dart';
import 'package:yobit/core/api/TimerNotifier.dart';
import 'package:yobit/core/api/counter.dart';
import 'package:yobit/core/styles/button.style.dart';
import 'package:yobit/core/ui/background/star.background.dart';
import 'package:yobit/core/ui/elements/btn.icon.dart';
import 'package:yobit/core/ui/elements/user.gadget.dart';
import 'package:yobit/router/navigation.model.dart';
import 'package:yobit/task/api/task.repo.dart';
import 'package:yobit/task/data/task.dart';
import 'package:yobit/task/ui/ads.slider.dart';
import 'package:yobit/task/ui/ads.slider.loader.dart';
import 'package:yobit/task/ui/task.description.dart';
import 'package:yobit/userTask/api/user.task.repo.dart';
import 'package:yobit/userTask/data/user.task.dart';

class TaskScreen extends StatefulWidget {
  final String taskId;
  final TaskRepository taskRepository;
  final UserTaskRepository userTaskRepo;

  const TaskScreen(
      {Key? key,
      required this.taskRepository,
      required this.taskId,
      required this.userTaskRepo})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _TaskScreen();
  }
}

class _TaskScreen extends State<TaskScreen> {
  File? imageFile;
  Task? task;
  UserTask? userTask;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    this.widget.taskRepository.getTask(this.widget.taskId).then((val) {
      this.setState(() {
        task = val;
      });
    }).catchError((err) {
      print(err);
    });
    this.widget.userTaskRepo.getUserTask(this.widget.taskId).then((val) {
      this.setState(() {
        if (val.isNotEmpty) userTask = val[0];
        isLoading = false;
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StarBackground(child: () {
      return Provider.value(
        value: task,
        child: VStack([
          HStack(
            [
              'Даалгавар ${task?.num ?? ""}'
                  .text
                  .headline5(context)
                  .white
                  .make(),
              UserGadget()
            ],
            alignment: MainAxisAlignment.spaceBetween,
          ).px32().wFull(context).pOnly(top: 56, bottom: 46),
          if (task != null)
            ChallengeDetailsTime(
              counter: SecondCounter(task!.endDate, ElapsedSecondNotifier()),
              type: TimerType.inSeconds,
            ).box.px32.make(),
          VxBox().height(48).make(),
          FutureBuilder(
              future: this.widget.taskRepository.getAds(),
              builder: (ctx, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if (snapshot.hasData)
                  return AdsSlider(items: snapshot.data as List<String>);
                return AdsSliderLoader();
              }),
          VxBox().height(48).make(),
          TaskDescription(),
          VxBox().height(27).make(),
          if (userTask != null)
            VStack(
              [
                Text('Илгээсэн даалгавар'),
                VxBox().height(12).make(),
                CachedNetworkImage(
                  imageUrl: userTask!.file,
                  width: 250,
                )
              ],
              alignment: MainAxisAlignment.center,
              crossAlignment: CrossAxisAlignment.center,
            ).wFull(context),
          VxBox().height(27).make(),
          HStack(
            [
              BtnIcon(
                iconBgColor: Theme.of(context).primaryColor,
                suffixImg: 'assets/icons/Back Icon.png',
                onPress: () {
                  Navigator.pop(context);
                },
              ).box.width(59).height(59).make(),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                      style: primaryButtonStyle(context),
                      onPressed: () {
                        // Navigator.pop(context);
                        if (userTask != null) return;
                        var navmodel = Provider.of<NavigationModel>(context,
                            listen: false);
                        navmodel.pushUpload(task!);
                      },
                      child: isLoading
                          ? CircularProgressIndicator()
                          : userTask == null
                              ? Text('Биелүүлэх')
                              : Text('Даалгавар илгээсэн байна'))
                  .box
                  .width(250)
                  .height(59)
                  .make()
            ],
            alignment: MainAxisAlignment.center,
            axisSize: MainAxisSize.max,
          ),
          SizedBox(
            height: 91,
          )
        ]).scrollVertical(),
      );
    });
  }
}
