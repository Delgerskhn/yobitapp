import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart';

class UserRepository {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  Future<void> updateUserPhoto(Uint8List data, String fileName) async {
    final extension = p.extension(fileName);
    var path = 'userPhotos/${auth.currentUser!.uid}$extension';
    storage.ref(path).putData(data);
    auth.currentUser!.updatePhotoURL(path);
  }
}
