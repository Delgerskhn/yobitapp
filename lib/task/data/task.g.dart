// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) {
  return Task(
    json['id'] as String,
    json['title'] as String,
    json['content'] as String,
    DateTime.parse(json['endDate'] as String),
    DateTime.parse(json['startDate'] as String),
    json['challengeId'] as String,
  );
}

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'endDate': instance.endDate.toIso8601String(),
      'startDate': instance.startDate.toIso8601String(),
      'challengeId': instance.challengeId,
    };
