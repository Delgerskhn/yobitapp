import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yobit/task/data/task.dart';
import 'package:yobit/utils/collectionParser.dart';

class UserTaskRepository {
  var store = FirebaseFirestore.instance;
  Future<List<Task>> getRecents() async {
    var doc = await store
        .collection('userTasks')
        .where('taskEndDate', isGreaterThan: Timestamp.now())
        .get();

    return parseCollectionFromDoc(doc, Task.fromStore);
  }
}
