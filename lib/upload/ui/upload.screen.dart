import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/core/styles/button.style.dart';
import 'package:yobit/core/ui/background/star.background.dart';
import 'package:yobit/core/ui/elements/btn.icon.dart';

import '../../core/ui/elements/user.gadget.dart';

class UploadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                VStack([
                  HStack([
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.star_border,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    'Танилцуулга'.text.white.make()
                  ]),
                  'Өнөөдрийн даалгаварт та найзтайгаа цуг зурагаа авхуулах юм.'
                      .text
                      .white
                      .make()
                ])
                    .box
                    .width(347)
                    .customRounded(BorderRadius.circular(25))
                    .color(Theme.of(context).primaryColor)
                    .p24
                    .make(),
                SizedBox(
                  height: 40,
                ),
                VStack([
                  'Даалгавар илгээх'.text.white.make(),
                  SizedBox(
                    height: 8,
                  ),
                  'Та доорх хэсэгт өнөөдрийн даалгавараа илгээх боломжтой'
                      .text
                      .white
                      .make(),
                  SizedBox(
                    height: 30,
                  ),
                  DottedBorder(
                    dashPattern: [6, 3, 2, 3],
                    borderType: BorderType.RRect,
                    color: Colors.white,
                    radius: const Radius.circular(12),
                    strokeWidth: 1,
                    child: VxBox(
                            child: IconButton(
                      icon: Icon(Icons.upload),
                      onPressed: () {},
                    ).box.size(80, 80).roundedFull.white.make())
                        .alignCenter
                        .width(290)
                        .height(156)
                        .make(),
                  )
                ])
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
