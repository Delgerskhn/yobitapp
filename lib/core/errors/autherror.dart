import 'package:firebase_auth/firebase_auth.dart';
import 'package:yobit/utils/toast.dart';

void handleAuthError(FirebaseAuthException e) {
  if (e.code == 'weak-password') {
    showError("Илүү найдвартай нууц үг ашиглана уу!");
  } else if (e.code == 'email-already-in-use') {
    showError("Бүртгэлтэй хаяг байна!");
  } else if (e.code == 'invalid-email' || e.code == 'auth/invalid-email') {
    showError("И-мэйл буруу байна!");
  } else if (e.code == 'user-disabled') {
    showError("Хаяг идэвхгүй болсон!");
  } else if (e.code == 'user-not-found' || e.code == 'auth/user-not-found') {
    showError("Хэрэглэгч олдсонгүй!");
  } else if (e.code == 'wrong-password') {
    showError("Буруу нууц үг!");
  } else {
    print(e.message);
    showError("Алдаа гарлаа!");
  }
}
