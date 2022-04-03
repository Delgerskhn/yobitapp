import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yobit/task/data/task.dart';
import 'package:yobit/userTask/data/user.task.dart';
import 'package:yobit/utils/collectionParser.dart';

class UserTaskRepository {
  var store = FirebaseFirestore.instance;
  Future<List<UserTask>> getRecents() async {
    var doc = await store
        .collection('userTasks')
        .where('taskEndDate', isGreaterThan: Timestamp.now())
        .get();

    return parseCollectionFromDoc(doc, UserTask.fromStore);
  }
}
