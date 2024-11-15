import 'package:firebase_auth/firebase_auth.dart';
import 'package:kurups_app/data/database_repo/database_repo.dart';
import 'package:kurups_app/entity/chapters/chapters_response.dart';
import 'package:kurups_app/entity/home/course_details.dart';
import 'package:kurups_app/entity/lessons/lessons_response.dart';
import 'package:kurups_app/entity/payment/payment_details_response.dart';
import 'package:kurups_app/entity/payment/payment_response.dart';
import 'package:kurups_app/entity/quizz/questions_response.dart';
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

  @override
  Future<List<ChaptersResponse>> getChapteersById({required String id}) async {
    return await _service.getChaptersById(id: id);
  }

  @override
  Future<LessonsResponse> getLessonsById(
      {required String docId, required String collection}) async {
    return await _service.getLessonsById(docId: docId, collection: collection);
  }

  @override
  Future<QuestionsResponse> getQuestionsById({required Map path}) async {
    return await _service.getQuestionsById(path: path);
  }

  @override
  Future<PaymentResponse> checkPaymentStatus({required Map path}) async {
    return await _service.checkPaymentStatus(path: path);
  }

  @override
  Future<PaymentDetailsResponse> getCoursePaymentDetails(
      {required Map path}) async {
    return await _service.getCoursePaymentDetails(path: path);
  }

  @override
  Future<void> setPaymentInfo(
      {required Map path,
      required int amount,
      required String paymentId}) async {
    await _service.setPaymentInfo(
        path: path, amount: amount, paymentId: paymentId);
  }
}
