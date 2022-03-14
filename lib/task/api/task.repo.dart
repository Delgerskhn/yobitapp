import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yobit/utils/imgProvider.dart';

class TaskRepository {
  var store = FirebaseFirestore.instance;

  Future<List<String>> getAds() async {
    var snapshot = await store.collection('ads').limit(10).get();
    List<String> ads = [];
    for (var doc in snapshot.docs) {
      ads.add(await getImgUrl(doc.data()['img']));
    }
    return ads;
  }
}
