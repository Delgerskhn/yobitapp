import 'package:firebase_auth/firebase_auth.dart';
import 'package:yobit/challenge/data/challenge.dart';
import 'package:yobit/utils/collectionParser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IChallengeRepository {
  Future<List<Challenge>> getFeaturedChallenges();
  Future<List<Challenge>> getRegularChallenges();
  Stream<QuerySnapshot<Map<String, dynamic>>> getIfUserJoinedChallenge(
      String challengeId);
  Future<bool> joinChallenge(String challengeId);
  Future<Challenge> getChallenge(String challengeID);
}

class ChallengeRepository extends IChallengeRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<Challenge>> getFeaturedChallenges() async {
    // throw Exception('Failed');
    var result = await firestore
        .collection("challenges")
        .where("isFeatured", isEqualTo: true)
        .where('endDate', isGreaterThan: Timestamp.now())
        .get();
    List<Challenge> challenges =
        await parseCollectionFromDoc<Challenge>(result, Challenge.fromStore);
    return challenges;
  }

  Future<List<Challenge>> getRegularChallenges() async {
    // throw Exception('Failed');
    var result = await firestore
        .collection("challenges")
        .where("isFeatured", isEqualTo: false)
        .where('endDate', isGreaterThan: Timestamp.now())
        .get();
    List<Challenge> challenges =
        await parseCollectionFromDoc<Challenge>(result, Challenge.fromStore);
    return challenges;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getIfUserJoinedChallenge(
      String challengeId) {
    // throw Exception('Failed');
    return firestore
        .collection('UserChallenge')
        .where('challengeId', isEqualTo: challengeId)
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
    // return result.size != 0;
  }

  Future<bool> joinChallenge(String challengeId) async {
    // throw Exception('Failed');
    await firestore.collection('UserChallenge').add({
      'userId': FirebaseAuth.instance.currentUser!.uid,
      'challengeId': challengeId,
    });
    return true;
  }

  Future<Challenge> getChallenge(String challengeID) async {
    // throw Exception('Failed');
    final entry =
        await firestore.collection("challenges").doc(challengeID).get();
    return Challenge.fromStore(entry);
  }
}
