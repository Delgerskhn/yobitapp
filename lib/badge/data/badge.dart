import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yobit/utils/imgProvider.dart';

class Badge {
  final String imgUrl;
  final String name;
  final int challenges;
  final int points;
  final int rank;
  final String userId;

  Badge({
    required this.imgUrl,
    required this.name,
    required this.challenges,
    required this.points,
    required this.rank,
    required this.userId,
  });

  static Future<Badge> fromStore(DocumentSnapshot snapshot) async {
    return Badge(
      imgUrl: await getImgUrl(snapshot['imgUrl']),
      name: snapshot['name'] ?? '',
      challenges: snapshot['challenges'],
      points: snapshot['points'],
      rank: snapshot['rank'],
      userId: snapshot['userId'],
    );
  }
}
