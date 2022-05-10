import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:yobit/upload/data/upload.repository.dart';
import 'package:yobit/upload/ui/file.preview.screen.dart';

class FilePreviewPage extends Page {
  final Uint8List imageFile;
  final String filePath;
  FilePreviewPage(this.imageFile, this.filePath)
      : super(key: ValueKey('FilePreviewPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return FilePreviewScreen(
          filePath: filePath,
          imageFile: imageFile,
          uploadRepository: UploadRepository(),
        );
      },
    );
  }
}
