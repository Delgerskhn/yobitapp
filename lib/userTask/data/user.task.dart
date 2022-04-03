import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yobit/user/data/user.dart';
import 'package:yobit/utils/imgProvider.dart';

class UserTask {
  final String file;
  final String taskId;
  final String taskTitle;
  final Timestamp taskEndDate;
  final User user;

  UserTask(
      {required this.file,
      required this.taskId,
      required this.taskTitle,
      required this.taskEndDate,
      required this.user});

  static Future<UserTask> fromStore(DocumentSnapshot doc) async {
    print(doc['user']);
    return UserTask(
        file: await getImgUrl(doc['file'] ?? ""),
        taskId: doc['taskId'],
        taskTitle: doc['taskTitle'],
        taskEndDate: doc['taskEndDate'],
        user: doc['user']);
  }
}
