import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kurups_app/service/firebase_services/firebase_database/database_keys.dart';
import 'package:kurups_app/utils/helper/app_toast_helper.dart';

class FirebaseDatabaseService {
  FirebaseDatabaseService._privateConstrustor();
  static final FirebaseDatabaseService instance =
      FirebaseDatabaseService._privateConstrustor();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future storeUserData({required User userData, required Map request}) async {
    try {
      await _firestore
          .collection(DatabaseKeys.userCollection)
          .doc(userData.uid)
          .set({...request});
    } catch (e) {
      showToast(message: e.toString());
    }
  }

  getUserDataById() async {}
}
