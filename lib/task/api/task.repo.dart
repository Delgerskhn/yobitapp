import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yobit/task/data/task.dart';
import 'package:yobit/utils/imgProvider.dart';

class TaskRepository {
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
}
