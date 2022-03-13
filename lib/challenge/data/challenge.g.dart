// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Challenge _$ChallengeFromJson(Map<String, dynamic> json) => Challenge(
      id: json['id'] as String,
      // featureImg: json['featureImg'] as String,
      // reward: json['reward'] as String,
      // startDate: DateTime.parse(json['startDate'] as String),
      title: json['title'] as String,
      content: json['content'] as String,
      endDate: Timestamp.fromDate(DateTime.parse(json['endDate'] as String)),
      imgUrl: json['imgUrl'] as String,
    );

Map<String, dynamic> _$ChallengeToJson(Challenge instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'endDate': instance.endDate,
      'imgUrl': instance.imgUrl,
      // 'startDate': instance.startDate.toIso8601String(),
      // 'featureImg': instance.featureImg,
      // 'reward': instance.reward,
    };
