import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/core/styles/button.style.dart';
import 'package:yobit/core/ui/background/star.background.dart';
import 'package:yobit/core/ui/elements/btn.icon.dart';
import 'package:yobit/core/ui/elements/user.gadget.dart';
import 'package:yobit/upload/ui/file.selector.dart';
import 'package:yobit/upload/ui/task.description.dart';

class UploadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return StarBackground(
    //   child: () => ZStack(
    //     [
    //       HStack(
    //         [
    //           'CU гараг'
    //               .text
    //               .white
    //               .size(24)
    //               .bold
    //               .make()
    //               .box
    //               .width(167)
    //               .px16
    //               .make()
    //               .box
    //               .py24
    //               .make(),
    //           VxBox(child: SizedBox())
    //               .size(180, 180)
    //               .bgImage(DecorationImage(
    //                   fit: BoxFit.contain,
    //                   image: NetworkImage(
    //                       'https://firebasestorage.googleapis.com/v0/b/yobit-54b2a.appspot.com/o/planets%2Fred%201.png?alt=media&token=17af4b23-1a57-4e89-8671-a26cea35fc2f')))
    //               .make(),
    //         ],
    //         crossAlignment: CrossAxisAlignment.start,
    //       ),
    //       VxBox(child: SizedBox())
    //           .color(Color.fromRGBO(0, 0, 0, 0.13))
    //           .size(90, 95)
    //           .transform(Matrix4.translationValues(0, 85, 0))
    //           .customRounded(BorderRadius.only(
    //               topRight: Radius.circular(25),
    //               bottomLeft: Radius.circular(25)))
    //           .make()
    //     ],
    //   )
    //       .box
    //       .width(347)
    //       .customRounded(BorderRadius.circular(25))
    //       .color(Color(0xffFF565E))
    //       .make(),
    // );

    return StarBackground(
        child: () => VStack(
              [
                HStack(
                  [
                    'Даалгавар 2'.text.headline5(context).white.make(),
                    UserGadget()
                  ],
                  alignment: MainAxisAlignment.spaceBetween,
                  axisSize: MainAxisSize.max,
                ).px32().pOnly(top: 56, bottom: 46),
                SizedBox(
                  height: 122,
                ),
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
                        // Navigator.pop(context);
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
