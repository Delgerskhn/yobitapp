import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;

class UploadRepository {
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore store = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> uploadTaskFile(
      String filePath, Uint8List file, String taskId) async {
    final extension = p.extension(filePath);
    final storagePath =
        'taskUploads/${auth.currentUser!.uid}-$taskId$extension';

    await storage.ref(storagePath).putData(file);

    var task = await store.collection('tasks').doc(taskId).get();

    await store.collection('userTasks').add({
      "taskId": taskId,
      "userId": auth.currentUser!.uid,
      "file": storagePath,
      "taskTitle": task['title'],
      "taskEndDate": task['endDate'],
      "user": {
        "userName": auth.currentUser!.displayName,
        "photoUrl": auth.currentUser!.photoURL
      }
    });
  }
}
