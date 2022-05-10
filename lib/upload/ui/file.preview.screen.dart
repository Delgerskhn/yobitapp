import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/core/styles/button.style.dart';
import 'package:yobit/core/ui/background/star.background.dart';
import 'package:yobit/core/ui/elements/btn.icon.dart';
import 'package:yobit/core/ui/elements/user.gadget.dart';
import 'package:yobit/router/navigation.model.dart';
import 'package:yobit/upload/data/upload.repository.dart';

class FilePreviewScreen extends StatefulWidget {
  final UploadRepository uploadRepository;
  final Uint8List imageFile;
  final String filePath;

  FilePreviewScreen(
      {Key? key,
      required this.imageFile,
      required this.uploadRepository,
      required this.filePath})
      : super(key: key);

  @override
  State<FilePreviewScreen> createState() => _FilePreviewScreenState();
}

class _FilePreviewScreenState extends State<FilePreviewScreen> {
  bool _isUploading = false;

  @override
  Widget build(BuildContext context) {
    return StarBackground(
        child: () => VStack(
              [
                HStack(
                  [UserGadget()],
                  alignment: MainAxisAlignment.end,
                  axisSize: MainAxisSize.max,
                ).px32().pOnly(top: 56, bottom: 27),
                'Илгээж буй зургаа нягтлах'
                    .text
                    .white
                    .size(22)
                    .bold
                    .make()
                    .box
                    .alignCenter
                    .make(),
                SizedBox(
                  height: 24,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.memory(this.widget.imageFile)
                      .box
                      .width(340)
                      .height(489)
                      .make(),
                ),
                SizedBox(
                  height: 24,
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
                      onPressed: () async {
                        if (_isUploading) return;
                        var navmodel = Provider.of<NavigationModel>(context,
                            listen: false);
                        setState(() {
                          _isUploading = true;
                        });
                        await widget.uploadRepository.uploadTaskFile(
                            this.widget.filePath,
                            widget.imageFile,
                            navmodel.taskId!);
                        setState(() {
                          _isUploading = false;
                        });

                        navmodel.pushChallengeFromUpload(navmodel.challengeId!);
                      },
                      child: _isUploading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text('Баталгаажуулах'),
                    ).box.width(250).height(59).make()
                  ],
                  alignment: MainAxisAlignment.center,
                  axisSize: MainAxisSize.max,
                ),
              ],
              alignment: MainAxisAlignment.center,
              crossAlignment: CrossAxisAlignment.center,
            ).scrollVertical());
  }
}
