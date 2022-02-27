import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:yobit/core/data/toaster.dart';

void handleAuthError(BuildContext context, FirebaseAuthException e) {
  var toaster = Provider.of<ToasterModel>(context);
  if (e.code == 'weak-password') {
    toaster.showError("Илүү найдвартай нууц үг ашиглана уу!");
  } else if (e.code == 'email-already-in-use') {
    toaster.showError("Бүртгэлтэй хаяг байна!");
  } else if (e.code == 'invalid-email') {
    toaster.showError("И-мэйл буруу байна!");
  }
}
