import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yobit/utils/imgProvider.dart';

class Badge {
  final String imgUrl;
  final String name;

  Badge(this.imgUrl, this.name);

  static Future<Badge> fromStore(DocumentSnapshot snapshot) async {
    return Badge(
        await getImgUrl(snapshot['imgUrl']) ?? '', snapshot['name'] ?? '');
  }
}
