import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yobit/task/data/task.dart';
import 'package:yobit/utils/collectionParser.dart';
import 'package:yobit/utils/imgProvider.dart';

abstract class ITaskRepository {
  Future<List<String>> getAds();
  Future<Task> getTask(String taskId);
  Future<List<Task>> getChallengeTasks(String challengeId);
}

class TaskRepository extends ITaskRepository {
  var store = FirebaseFirestore.instance;

  Future<List<String>> getAds() async {
    var snapshot = await store.collection('ads').limit(10).get();
    List<String> ads = [];
    for (var doc in snapshot.docs) {
      ads.add(await getImgUrl(doc.data()['img']));
    }
    return ads;
  }

  Future<Task> getTask(String taskId) async {
    var doc = await store.collection('tasks').doc(taskId).get();
    return Task.fromStore(doc);
  }

  Future<List<Task>> getChallengeTasks(String challengeId) async {
    // throw Exception('Failed');
    final result = await store
        .collection("tasks")
        .where("challengeId", isEqualTo: challengeId)
        .get();
    List<Task> res = await parseCollectionFromDoc(result, Task.fromStore);
    return res;
  }
}
