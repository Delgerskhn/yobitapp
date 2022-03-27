import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yobit/upload/data/upload.repository.dart';
import 'package:yobit/upload/ui/file.preview.screen.dart';

class FilePreviewPage extends Page {
  final XFile imageFile;
  FilePreviewPage(this.imageFile) : super(key: ValueKey('FilePreviewPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return FilePreviewScreen(
          imageFile: imageFile,
          uploadRepository: UploadRepository(),
        );
      },
    );
  }
}
