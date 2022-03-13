import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yobit/utils/imgProvider.dart';

// part 'challenge.g.dart';

@JsonSerializable()
class Challenge {
  final String id;
  final String title;
  final String content;
  final Timestamp endDate;
  final Timestamp startDate;
  final String imgUrl;
  final String featureImg;
  final String reward;

  const Challenge(
      {required this.id,
      required this.featureImg,
      required this.reward,
      required this.startDate,
      required this.title,
      required this.content,
      required this.endDate,
      required this.imgUrl});

  static Future<Challenge> fromStore(DocumentSnapshot doc) async {
    return Challenge(
      id: doc.id,
      title: doc['title'] ?? "",
      content: doc['content'] ?? "",
      endDate: doc['endDate'] ?? Timestamp.fromDate(DateTime.now()),
      imgUrl: await getImgUrl(doc['imgUrl'] ?? ""),
      startDate: doc['startDate'] ?? Timestamp.fromDate(DateTime.now()),
      featureImg: await getImgUrl(doc['featureImg'] ?? ""),
      reward: doc['reward'] ?? "",
    );
  }

  // static Future<Challenge> fromJson(Map<String, dynamic> json) async {
  //   json['imgUrl'] = await getImgUrl(json['imgUrl']);
  //   json['featureImg'] = await getImgUrl(json['featureImg']);
  //   return _$ChallengeFromJson(json);
  // }

  // Map<String, dynamic> toJson() => _$ChallengeToJson(this);
}
