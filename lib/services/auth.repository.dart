import 'package:firebase_auth/firebase_auth.dart';
import 'package:yobit/services/preference.dart';

//TODO: catch exception and show relevant error sms to client
class AuthRepository {
  final Preference preference;
  FirebaseAuth auth = FirebaseAuth.instance;

  AuthRepository(this.preference);

  Future<bool> login(email, password) async {
    // UserCredential userCredential =
    await auth.signInWithEmailAndPassword(email: email, password: password);

    return true;
  }

  Future<bool> resetPass(email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return false;
    }
    return true;
  }

  Future<bool> confirmPassReset(code, newPass) async {
    try {
      await auth.confirmPasswordReset(code: code, newPassword: newPass);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return false;
    }
    return true;
  }

  Future<bool> register(email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> logout() async {
    await auth.signOut();
    return true;
  }
}
