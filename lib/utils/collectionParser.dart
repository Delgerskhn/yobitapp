import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<List<T>> parseCollection<T>(QuerySnapshot<Map<String, dynamic>> snapshot,
    Future<T> Function(Map<String, dynamic> json) parser) async {
  List<T> collection = [];
  for (var doc in snapshot.docs) {
    var c = doc.data();
    c['id'] = doc.id;
    collection.add(await parser(c));
  }
  return collection;
}

Future<List<T>> parseCollectionFromDoc<T>(
    QuerySnapshot<Map<String, dynamic>> snapshot,
    Future<T> Function(DocumentSnapshot doc) parser) async {
  List<T> collection = [];
  for (var doc in snapshot.docs) {
    collection.add(await parser(doc));
  }
  return collection;
}

Future<T> parseDocument<T>(DocumentSnapshot<Map<String, dynamic>> snapshot,
    Future<T> Function(Map<String, dynamic> json) parser) async {
  dynamic c = snapshot.data();
  c['id'] = snapshot.id;
  return await parser(c);
}
