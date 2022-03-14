import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/challenge/ui/widget/detail/challenge.details.time.dart';
import 'package:yobit/core/styles/button.style.dart';
import 'package:yobit/core/ui/background/star.background.dart';
import 'package:yobit/core/ui/elements/btn.icon.dart';
import 'package:yobit/core/ui/elements/user.gadget.dart';
import 'package:yobit/task/api/task.repo.dart';
import 'package:yobit/task/data/task.dart';
import 'package:yobit/task/ui/ads.slider.dart';
import 'package:yobit/task/ui/ads.slider.loader.dart';
import 'package:yobit/task/ui/task.description.dart';

class TaskScreen extends StatefulWidget {
  final String taskId;
  final TaskRepository taskRepository;

  const TaskScreen(
      {Key? key, required this.taskRepository, required this.taskId})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _TaskScreen();
  }
}

class _TaskScreen extends State<TaskScreen> {
  File? imageFile;
  Task? task;
  @override
  Widget build(BuildContext context) {
    this.widget.taskRepository.getTask(this.widget.taskId).then((val) {
      this.setState(() {
        task = val;
      });
    }).catchError((err) {
      print(err);
    });
    return StarBackground(
        child: () => Provider.value(
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
                ).px32().pOnly(top: 56, bottom: 46),
                if (task != null)
                  ChallengeDetailsTime(
                    endDate: task!.endDate,
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
                      },
                      child: Text('Биелүүлэх'),
                    ).box.width(250).height(59).make()
                  ],
                  alignment: MainAxisAlignment.center,
                  axisSize: MainAxisSize.max,
                ),
                SizedBox(
                  height: 91,
                )
              ]).scrollVertical(),
            ));
  }
}
