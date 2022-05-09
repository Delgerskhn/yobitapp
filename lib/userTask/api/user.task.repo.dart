import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yobit/task/data/task.dart';
import 'package:yobit/userTask/data/user.task.dart';
import 'package:yobit/utils/collectionParser.dart';

class UserTaskRepository {
  var store = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;
  Future<List<UserTask>> getRecents() async {
    var doc = await store
        .collection('userTasks')
        .where('taskEndDate', isGreaterThan: Timestamp.now())
        .get();

    return parseCollectionFromDoc(doc, UserTask.fromStore);
  }

  Future<List<UserTask>> getUserTask(String taskId) async {
    var doc = await store
        .collection('userTasks')
        .where('taskId', isEqualTo: taskId)
        .where('userId', isEqualTo: auth.currentUser!.uid)
        .get();

    return parseCollectionFromDoc(doc, UserTask.fromStore);
  }

  Future<List<UserTask>> getUserTasks() async {
    var doc = await store
        .collection('userTasks')
        .where('userId', isEqualTo: auth.currentUser!.uid)
        .get();

    return parseCollectionFromDoc(doc, UserTask.fromStore);
  }

  Future<List<Task>> getAllChallengeTasks() async {
    var userId = FirebaseAuth.instance.currentUser!.uid;
    var instance = FirebaseFirestore.instance;
    Iterable<String> userChallenges = (await instance
            .collection('UserChallenge')
            .where(
              'userId',
              isEqualTo: userId,
            )
            .get())
        .docs
        .map((e) => (e['challengeId']));
    var tasks = parseCollectionFromDoc(
        (await instance
            .collection('tasks')
            .where('challengeId', whereIn: userChallenges.toList())
            .get()),
        Task.fromStore);
    return tasks;
  }
}
