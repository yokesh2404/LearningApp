import 'package:firebase_auth/firebase_auth.dart';
import 'package:kurups_app/entity/home/course_details.dart';
import 'package:kurups_app/entity/request/user_details/user_details.dart';

abstract class DatabaseRepo {
  Future<void> storeUserData({required User userData, required Map request});

  Future<UserDetails> getUserDataById();

  Future<List<BasicConcept>> getCourseList();
}
