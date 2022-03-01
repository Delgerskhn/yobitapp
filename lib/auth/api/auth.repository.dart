import 'package:firebase_auth/firebase_auth.dart';

//TODO: catch exception and show relevant error sms to client
class AuthRepository {
  FirebaseAuth auth = FirebaseAuth.instance;

  AuthRepository();

  Future<bool> login(email, password) async {
    // UserCredential userCredential =
    await auth.signInWithEmailAndPassword(email: email, password: password);

    return true;
  }

  Future<bool> resetPass(email) async {
    await auth.sendPasswordResetEmail(email: email);
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

  Future<bool> register(email, name, password) async {
    auth.authStateChanges().listen((user) {
      if (user != null) user.updateDisplayName(name);
    });
    await auth.createUserWithEmailAndPassword(email: email, password: password);
    return true;
  }

  Future<bool> logout() async {
    await auth.signOut();
    return true;
  }
}
