import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:kurups_app/data/auth_repo/auth_repo.dart';
import 'package:kurups_app/data/database_repo/database_repo.dart';
import 'package:kurups_app/data/payment_service/payment_service_repo.dart';
import 'package:kurups_app/entity/lessons/lessons_response.dart';
import 'package:kurups_app/entity/payment/payment_details_response.dart';
import 'package:kurups_app/service/firebase_services/firebase_database/firebase_database_service.dart';
import 'package:kurups_app/service/log_services/log_service.dart';
import 'package:kurups_app/service/payment_service/payment_service.dart';
import 'package:kurups_app/utils/bloc_core/ui_status.dart';
import 'package:kurups_app/utils/constants/app_config.dart';
import 'package:kurups_app/utils/helper/route_helper.dart';
import 'package:kurups_app/widgets/full_screen_dialog.dart';
import 'package:kurups_app/widgets/payment_dialog.dart';

part 'lessons_event.dart';
part 'lessons_state.dart';
part 'lessons_bloc.freezed.dart';

class LessonsBloc extends Bloc<LessonsEvent, LessonsState> {
  late final AuthRepo _authServices;
  late final DatabaseRepo _databaseService;
  late final LogService _logService;
  late final PaymentServiceRepo _paymentRepo;
  LessonsBloc(
      {required AuthRepo authServices,
      required DatabaseRepo databaseService,
      required LogService logService,
      required PaymentServiceRepo paymentServiceRepo})
      : super(LessonsState()) {
    _authServices = authServices;
    _databaseService = databaseService;
    _logService = logService;
    _paymentRepo = paymentServiceRepo;
    on<LessonsEvent>((event, emit) {});
    on<GetLessons>((event, emit) => getLessons(event, emit));
    on<ClickLessons>((event, emit) => clickLessons(event, emit));
    on<PaymentClick>((event, emit) => buyCourse(event, emit));
  }

  void getLessons(GetLessons event, Emitter emit) async {
    var course = event.databasePath["course"];
    var path = event.databasePath["selectedChapter"];
    emit(state.copyWith(status: UIStatus.loading()));
    LessonsResponse response =
        await _databaseService.getLessonsById(docId: course, collection: path);

    if (response.data != null) {
      emit(state.copyWith(
          status: UIStatus.loadSuccess(), lessonsResponse: response));
    } else {
      emit(state.copyWith(status: UIStatus.loadFailed()));
    }
  }

  void clickLessons(ClickLessons event, Emitter emit) async {
    Map finalReq = {...event.databasePath, ...event.data.toJson()};
    var paymentStatus =
        await _databaseService.checkPaymentStatus(path: event.databasePath);
    if (paymentStatus.data != null && paymentStatus.data!.paymentId != null) {
      GoRouter.of(event.context)
          .pushNamed(RouteHelper.videoScreenName, extra: finalReq);
    } else {
      var paymentData = await _databaseService.getCoursePaymentDetails(
          path: event.databasePath);
      if (paymentData.data != null) {
        FullScreenDialog.showFullScreenPopup(event.context,
            child: PaymentDialog(
              paymentDetails: paymentData.data!,
              bloc: this,
              path: event.databasePath,
              lessonsData: event.data,
            ));
      }
    }

    // FirebaseDatabaseService()
    //     .setPaymentInfo(path: event.databasePath, amount: 200, paymentId: '');
    // _paymentRepo.openRazorpay(paymentRequest: {});
  }

  buyCourse(PaymentClick event, Emitter emit) async {
    if (event.paymentDetails.amount != null) {
      var options = {
        'key': AppConfig.razorPayKey,
        'amount': event.paymentDetails.amount! * 100,
        'name': 'kurups maths',
        'description': event.paymentDetails.courseName,
        // 'prefill': {'contact': '1234567890', 'email': 'text@gmail.com'},
        // 'external': {
        //   'wallets': ['paytm']
        // }
      };
      Map finalReq = {...event.databasePath, ...event.data.toJson()};
      _paymentRepo.openRazorpay(
          paymentRequest: options,
          path: event.databasePath,
          lessonsData: finalReq);
    }
  }
}
