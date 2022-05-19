import 'package:firebase_storage/firebase_storage.dart';

Map<String, String> imgUrls = {};

Future<String> getImgUrl(String fname) async {
  if (fname.isEmpty) return '';

  if (!imgUrls.containsKey(fname))
    imgUrls[fname] = await FirebaseStorage.instance.ref(fname).getDownloadURL();
  return imgUrls[fname]!;
}
