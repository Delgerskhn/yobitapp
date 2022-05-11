import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yobit/utils/imgProvider.dart';

class Challenge {
  final String id;
  final String title;
  final String content;
  final Timestamp endDate;
  final Timestamp startDate;
  final String imgUrl;
  final String featureImg;
  final String reward;
  final String planet;
  final String color;

  Challenge(
      {required this.id,
      required this.featureImg,
      required this.reward,
      required this.startDate,
      required this.title,
      required this.content,
      required this.endDate,
      required this.imgUrl,
      required this.color,
      required this.planet});

  static Future<Challenge> fromStore(DocumentSnapshot doc) async {
    return Challenge(
        id: doc.get('id'),
        title: doc.get('title') ?? "",
        content: doc.get('content') ?? "",
        endDate: doc.get('endDate') ?? Timestamp.fromDate(DateTime.now()),
        imgUrl: await getImgUrl(doc.get('imgUrl') ?? ""),
        startDate: doc.get('startDate') ?? Timestamp.fromDate(DateTime.now()),
        featureImg: await getImgUrl(doc.get('featureImg') ?? ""),
        reward: doc.get('reward') ?? "",
        planet: await getImgUrl(doc.get('planet') ?? ""),
        color: doc.get('color') ?? "");
  }
}
