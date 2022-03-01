import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:yobit/core/data/toaster.dart';
import 'package:yobit/utils/toast.dart';

void handleAuthError(BuildContext context, FirebaseAuthException e) {
  if (e.code == 'weak-password') {
    showError(context, "Илүү найдвартай нууц үг ашиглана уу!");
  } else if (e.code == 'email-already-in-use') {
    showError(context, "Бүртгэлтэй хаяг байна!");
  } else if (e.code == 'invalid-email') {
    showError(context, "И-мэйл буруу байна!");
  } else if (e.code == 'user-disabled') {
    showError(context, "Хаяг идэвхгүй болсон!");
  } else if (e.code == 'user-not-found') {
    showError(context, "Хэрэглэгч олдсонгүй!");
  } else if (e.code == 'wrong-password') {
    showError(context, "Буруу нууц үг!");
  }
}
