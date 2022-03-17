import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yobit/utils/collectionParser.dart';

import '../data/badge.dart';

class BadgeRepository {
  FirebaseFirestore store = FirebaseFirestore.instance;
  Future<Iterable<Badge>> getUserBadges() async {
    var badges = await store
        .collection('UserBadge')
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    return parseCollectionFromDoc(badges, Badge.fromStore);
  }
}
