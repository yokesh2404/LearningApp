import 'package:firebase_auth/firebase_auth.dart';
import 'package:kurups_app/service/firebase_services/firebase_errors/firebase_auth_errors.dart';
import 'package:kurups_app/utils/helper/app_toast_helper.dart';

class FirebaseAuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      showToast(message: FirebaseAuthErrorCodes.getErrorMessage(e.code));
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      // if (FirebaseAuthErrorCodes.getErrorMessage(e.code) != null) {
      showToast(message: FirebaseAuthErrorCodes.getErrorMessage(e.code));
      // } else {
      //   showToast(message: 'An error occurred: ${e.code}');
      // }
    }
    return null;
  }
}
