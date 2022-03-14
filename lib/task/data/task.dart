import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String id;
  final String title;
  final String content;
  final int num;
  final Timestamp endDate;
  final Timestamp startDate;
  final String challengeId;

  Task(this.id, this.title, this.content, this.endDate, this.startDate,
      this.challengeId, this.num);

  static Future<Task> fromStore(DocumentSnapshot doc) async {
    return Task(
        doc.id,
        doc['title'] ?? '',
        doc['content'] ?? "",
        doc['endDate'] ?? Timestamp.fromDate(DateTime.now()),
        doc['startDate'] ?? Timestamp.fromDate(DateTime.now()),
        doc['challengeId'] ?? '',
        doc['num'] ?? 0);
  }
}
