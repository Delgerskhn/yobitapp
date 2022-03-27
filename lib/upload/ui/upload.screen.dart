import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/core/styles/button.style.dart';
import 'package:yobit/core/ui/background/star.background.dart';
import 'package:yobit/core/ui/elements/btn.icon.dart';
import 'package:yobit/core/ui/elements/user.gadget.dart';
import 'package:yobit/task/data/task.dart';
import 'package:yobit/upload/ui/file.selector.dart';
import 'package:yobit/upload/ui/task.description.dart';

class UploadScreen extends StatelessWidget {
  final Task task;

  const UploadScreen({Key? key, required this.task}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StarBackground(
        child: () => VStack(
              [
                HStack(
                  [
                    'Даалгавар 1'.text.headline5(context).white.make(),
                    UserGadget()
                  ],
                  alignment: MainAxisAlignment.spaceBetween,
                  axisSize: MainAxisSize.max,
                ).px32().pOnly(top: 56, bottom: 46),
                TaskDescription()
                    .box
                    .width(347)
                    .customRounded(BorderRadius.circular(25))
                    .color(Theme.of(context).primaryColor)
                    .p24
                    .make(),
                SizedBox(
                  height: 40,
                ),
                FileSelector()
                    .box
                    .width(347)
                    .p24
                    .customRounded(BorderRadius.circular(25))
                    .color(Theme.of(context).colorScheme.secondary)
                    .make(),
                SizedBox(
                  height: 21,
                ),
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
                        // TODO: save file to firebase storage
                      },
                      child: Text('Илгээх'),
                    ).box.width(250).height(59).make()
                  ],
                  alignment: MainAxisAlignment.center,
                  axisSize: MainAxisSize.max,
                ),
              ],
              crossAlignment: CrossAxisAlignment.center,
            ).scrollVertical());
  }
}
