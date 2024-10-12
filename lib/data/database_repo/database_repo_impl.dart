import 'package:firebase_auth/firebase_auth.dart';
import 'package:kurups_app/data/database_repo/database_repo.dart';
import 'package:kurups_app/entity/home/course_details.dart';
import 'package:kurups_app/entity/request/user_details/user_details.dart';
import 'package:kurups_app/service/firebase_services/firebase_database/firebase_database_service.dart';

class DatabaseRepoImpl extends DatabaseRepo {
  DatabaseRepoImpl({required FirebaseDatabaseService service})
      : _service = service;

  late final FirebaseDatabaseService _service;
  @override
  Future<UserDetails> getUserDataById() async {
    return await _service.getUserDataById();
  }

  @override
  Future<void> storeUserData(
      {required User userData, required Map request}) async {
    await _service.storeUserData(userData: userData, request: request);
  }

  @override
  Future<List<BasicConcept>> getCourseList() async {
    return await _service.getCourseList();
  }
}
