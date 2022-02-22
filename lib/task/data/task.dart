import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  final String id;
  final String title;
  final String content;
  final DateTime endDate;
  final DateTime startDate;
  final String challengeId;

  Task(this.id, this.title, this.content, this.endDate, this.startDate,
      this.challengeId);

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
