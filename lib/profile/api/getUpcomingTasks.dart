import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yobit/task/data/task.dart';
import 'package:yobit/utils/collectionParser.dart';

Future<List<Task>> getUpcomingTasks() async {
  var userId = FirebaseAuth.instance.currentUser?.uid;
  if (userId == null) return [];
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
          .where('endDate', isGreaterThan: Timestamp.now())
          .get()),
      Task.fromStore);
  return tasks;
}
