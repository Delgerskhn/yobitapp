import 'package:firebase_storage/firebase_storage.dart';

Future<List<String>> getAdvantageImages() async {
  var imgUrl = await FirebaseStorage.instance
      .ref('specialchallenge.png')
      .getDownloadURL();
  return [imgUrl, imgUrl, imgUrl];
}
