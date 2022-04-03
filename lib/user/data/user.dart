import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yobit/utils/imgProvider.dart';

class User {
  final String userName;
  final String photoURL;

  User(this.userName, this.photoURL);

  static Future<User> fromStore(DocumentSnapshot doc) async {
    return User(doc['userName'], doc['photoURL']);
  }

  static Future<User> fromMap(Map<String, dynamic> doc) async {
    return User(doc['userName'], await getImgUrl(doc['photoUrl']));
  }
}
