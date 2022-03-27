import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;

class UploadRepository {
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore store = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> uploadTaskFile(String filePath, String taskId) async {
    File file = File(filePath);
    final extension = p.extension(filePath);
    final storagePath =
        'taskUploads/${auth.currentUser!.uid}-$taskId$extension';

    await storage.ref(storagePath).putFile(file);

    await store.collection('userTasks').add({
      "taskId": taskId,
      "userId": auth.currentUser!.uid,
      "file": storagePath
    });
  }
}
