import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yobit/core/errors/autherror.dart';
import 'package:yobit/router/navigation.model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends ChangeNotifier {
  final BuildContext context;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;
  bool loggedIn = false;

  AuthViewModel(this.context) {
    auth.authStateChanges().listen((user) {
      loggedIn = user != null;
      notifyListeners();
    });
  }

  void login(email, password) {
    loading = true;
    notifyListeners();
    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      var navmodel = Provider.of<NavigationModel>(context, listen: false);
      print(navmodel.loggedIn);
      loggedIn = true;
    }).catchError((err) {
      handleAuthError(err);
    }, test: (e) => e is FirebaseAuthException).whenComplete(() {
      loading = false;
      notifyListeners();
    });
  }

  Future<void> sendPasswordResetEmail(email) {
    loading = true;
    notifyListeners();
    return auth
        .sendPasswordResetEmail(email: email)
        .then((value) {})
        .catchError((err) {
      handleAuthError(err);
    }, test: (e) => e is FirebaseAuthException).whenComplete(() {
      loading = false;
      notifyListeners();
    });
  }

  void confirmPasswordReset(code, newPass) {
    loading = true;
    notifyListeners();
    auth.confirmPasswordReset(code: code, newPassword: newPass).catchError(
        (err) {
      handleAuthError(err);
    }, test: (e) => e is FirebaseAuthException).whenComplete(() {
      loading = false;
      notifyListeners();
    });
  }

  Future<void> googleSignup() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;
      loggedIn = true;

      if (result != null) {
        notifyListeners();
      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }

  void signup(email, name, password) {
    loading = true;
    notifyListeners();
    auth.authStateChanges().listen((user) {
      if (user != null) user.updateDisplayName(name);
    });
    auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {})
        .catchError((err) {
      handleAuthError(err);
    }, test: (e) => e is FirebaseAuthException).whenComplete(() {
      loading = false;
      notifyListeners();
    });
  }

  void logout() {
    loading = true;
    notifyListeners();
    auth.signOut().catchError((err) {
      handleAuthError(err);
    }, test: (e) => e is FirebaseAuthException).whenComplete(() {
      loading = false;
      loggedIn = false;
      notifyListeners();
    });
  }
}
