import 'package:firebase_auth/firebase_auth.dart';
import 'package:kurups_app/entity/chapters/chapters_response.dart';
import 'package:kurups_app/entity/home/course_details.dart';
import 'package:kurups_app/entity/lessons/lessons_response.dart';
import 'package:kurups_app/entity/payment/payment_details_response.dart';
import 'package:kurups_app/entity/payment/payment_response.dart';
import 'package:kurups_app/entity/quizz/questions_response.dart';
import 'package:kurups_app/entity/request/user_details/user_details.dart';

abstract class DatabaseRepo {
  Future<void> storeUserData({required User userData, required Map request});

  Future<UserDetails> getUserDataById();

  Future<List<BasicConcept>> getCourseList();

  Future<List<ChaptersResponse>> getChapteersById({required String id});

  Future<LessonsResponse> getLessonsById(
      {required String docId, required String collection});

  Future<QuestionsResponse> getQuestionsById({required Map path});

  Future<PaymentDetailsResponse> getCoursePaymentDetails({required Map path});

  Future<PaymentResponse> checkPaymentStatus({required Map path});

  Future<void> setPaymentInfo(
      {required Map path, required int amount, required String paymentId});
}
