import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<User?> signInWithEmailPassword(
      {required String email, required String password});

  Future<User?> signUpWithEmailAndPassword(
      {required String email, required String password});

  Future<void> signOut();
}
