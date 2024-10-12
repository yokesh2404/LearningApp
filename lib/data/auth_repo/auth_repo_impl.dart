import 'package:firebase_auth/firebase_auth.dart';
import 'package:kurups_app/data/auth_repo/auth_repo.dart';
import 'package:kurups_app/service/firebase_services/firebase_auth_implementation/firebase_auth_services.dart';

class AuthRepoImpl extends AuthRepo {
  AuthRepoImpl({required FirebaseAuthServices authServices})
      : _authServices = authServices;

  late final FirebaseAuthServices _authServices;

  @override
  Future<User?> signInWithEmailPassword(
      {required String email, required String password}) async {
    return await _authServices.signInWithEmailAndPassword(email, password);
  }

  @override
  Future<User?> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    return await _authServices.signUpWithEmailAndPassword(email, password);
  }

  @override
  Future<void> signOut() {
    return _authServices.signOut();
  }
}
