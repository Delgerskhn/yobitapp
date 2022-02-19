// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Challenge _$ChallengeFromJson(Map<String, dynamic> json) {
  return Challenge(
    title: json['title'] as String,
    content: json['content'] as String,
    endDate: DateTime.parse(json['endDate'] as String),
    imgUrl: json['imgUrl'] as String,
  );
}

Map<String, dynamic> _$ChallengeToJson(Challenge instance) => <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'endDate': instance.endDate.toIso8601String(),
      'imgUrl': instance.imgUrl,
    };
