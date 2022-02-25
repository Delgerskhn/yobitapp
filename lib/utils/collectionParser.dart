import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:yobit/challenge/data/challenge.dart';

Future<List<T>> parseCollection<T>(QuerySnapshot<Map<String, dynamic>> snapshot,
    T Function(Map<String, dynamic> json) parser) async {
  List<T> collection = [];
  for (var doc in snapshot.docs) {
    var c = doc.data();
    c['imgUrl'] =
        await FirebaseStorage.instance.ref(c['imgUrl']).getDownloadURL();
    c['id'] = doc.id;
    collection.add(parser(c));
  }
  return collection;
}

Future<T> parseDocument<T>(DocumentSnapshot<Map<String, dynamic>> snapshot,
    T Function(Map<String, dynamic> json) parser) async {
  dynamic c = snapshot.data();
  c['id'] = snapshot.id;
  c['imgUrl'] =
      await FirebaseStorage.instance.ref(c['imgUrl']).getDownloadURL();
  return parser(c);
}
