import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kurups_app/entity/chapters/chapters_response.dart';
import 'package:kurups_app/entity/home/course_details.dart';
import 'package:kurups_app/entity/lessons/lessons_response.dart';
import 'package:kurups_app/entity/request/user_details/user_details.dart';
import 'package:kurups_app/service/firebase_services/firebase_database/database_keys.dart';
import 'package:kurups_app/utils/constants/shared_pref_keys.dart';
import 'package:kurups_app/utils/helper/app_toast_helper.dart';
import 'package:kurups_app/utils/helper/shared_pref_controller.dart';

class FirebaseDatabaseService {
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

  Future<UserDetails> getUserDataById() async {
    UserDetails userDetails = UserDetails();

    try {
      String userId = await SharedPrefController.instance
          .getStringData(key: SharedPrefKeys.userId);

      if (userId.isNotEmpty) {
        var jsonData = await _firestore
            .collection(DatabaseKeys.userCollection)
            .doc(userId)
            .get();
        userDetails = jsonData.data() != null
            ? UserDetails.fromJson(jsonData.data()!)
            : UserDetails();
      }
    } catch (e) {
      userDetails = UserDetails();
    }

    return userDetails;
  }

  Future<List<BasicConcept>> getCourseList() async {
    List<BasicConcept> courseList = [];

    try {
      var _data = await _firestore.collection(DatabaseKeys.homeCourses).get();

      var snapshot = await _data.docs.map((e) => e.data()).toList();

      snapshot.forEach(
        (element) {
          courseList.add(BasicConcept.fromJson(element.values.first));
        },
      );
      return courseList;
    } catch (e) {
      return courseList;
    }
  }

  Future<List<ChaptersResponse>> getChaptersById({required String id}) async {
    List<ChaptersResponse> _chapters = [];

    try {
      var _data =
          await _firestore.collection(DatabaseKeys.courses).doc(id).get();

      var snapshot = await _data.data()!;
      if (snapshot[id] != null) {
        List _list = snapshot[id];
        _list.forEach(
          (element) {
            print(element);
            _chapters.add(ChaptersResponse.fromJson(element));
          },
        );
      }
      return _chapters;
    } catch (e) {
      return _chapters;
    }
  }

  Future<LessonsResponse> getLessonsById(
      {required String docId, required String collection}) async {
    LessonsResponse _lessons = LessonsResponse();

    try {
      var _data = await _firestore
          .collection(DatabaseKeys.courses)
          .doc(docId)
          .collection(collection)
          .get();

      var snapshot = await _data.docs.first;

      _lessons = LessonsResponse.fromJson(snapshot.data());

      return _lessons;
    } catch (e) {
      return _lessons;
    }
  }
}
