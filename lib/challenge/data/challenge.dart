import 'package:json_annotation/json_annotation.dart';

part 'challenge.g.dart';

@JsonSerializable()
class Challenge {
  final String id;
  final String title;
  final String content;
  final DateTime endDate;
  final String imgUrl;

  const Challenge(
      {required this.id,
      required this.title,
      required this.content,
      required this.endDate,
      required this.imgUrl});

  static Challenge fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);
  Map<String, dynamic> toJson() => _$ChallengeToJson(this);
}
