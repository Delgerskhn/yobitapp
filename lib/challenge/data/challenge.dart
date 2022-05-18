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
    var data = doc.data() as dynamic;
    return Challenge(
        id: doc.id,
        title: data['title'] ?? "",
        content: data['content'] ?? "",
        endDate: data['endDate'] ?? Timestamp.fromDate(DateTime.now()),
        imgUrl: await getImgUrl(data['imgUrl'] ?? ""),
        startDate: data['startDate'] ?? Timestamp.fromDate(DateTime.now()),
        featureImg: await getImgUrl(data['featureImg'] ?? ""),
        reward: data['reward'] ?? "",
        planet: await getImgUrl(data['planet'] ?? ""),
        color: data['color'] ?? "");
  }
}
