import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Task {
  final String id;
  final String title;
  final String content;
  final Timestamp endDate;
  final Timestamp startDate;
  final String challengeId;

  Task(this.id, this.title, this.content, this.endDate, this.startDate,
      this.challengeId);

  static Future<Task> fromStore(DocumentSnapshot doc) async {
    return Task(
        doc.id,
        doc['title'] ?? '',
        doc['content'] ?? "",
        doc['endDate'] ?? Timestamp.fromDate(DateTime.now()),
        doc['startDate'] ?? Timestamp.fromDate(DateTime.now()),
        doc['challengeId'] ?? '');
  }

  // static Future<Task> fromJson(Map<String, dynamic> json) async {
  //   return _$TaskFromJson(json);
  // }

  // Map<String, dynamic> toJson() => _$TaskToJson(this);
}
