import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseMethods {
  Future addUsersDetails(Map<String, dynamic> usersInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(usersInfoMap);
  }

  // Stream<QuerySnapshot> getUsersDetails() {
  //   return FirebaseFirestore.instance.collection("users").snapshots();
  // }

//changes N
  Future<QuerySnapshot<Map<String, dynamic>>> getUsersDetails(
      String userEmail) async {
    return await FirebaseFirestore.instance.collection("home").get();
  }

//video import from firebase
  Future<String> getVideoUrl(String videoPath) async {
    try {
      String downloadUrl = await FirebaseStorage.instance
          .ref(videoPath) // Specify the path in your storage
          .getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('Error fetching video URL: $e');
    }
  }
}
