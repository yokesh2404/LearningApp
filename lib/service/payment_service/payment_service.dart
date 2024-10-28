import 'package:go_router/go_router.dart';
import 'package:kurups_app/entity/payment/payment_response.dart';
import 'package:kurups_app/service/firebase_services/firebase_database/firebase_database_service.dart';
import 'package:kurups_app/utils/constants/app_string.dart';
import 'package:kurups_app/utils/helper/app_toast_helper.dart';
import 'package:kurups_app/utils/helper/route_helper.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentService {
  late FirebaseDatabaseService _databaseService;
  PaymentService({required FirebaseDatabaseService databaseService}) {
    _databaseService = databaseService;
  }

  Razorpay _razorpay = Razorpay();
  Map<String, dynamic> _paymentRequest = {};
  Map _path = {};
  Map _lessonsData = {};
  initRazorPay() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handleSuccessEvent);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handleErrorEvent);
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handleSuccessEvent);
  }

  handleSuccessEvent(PaymentSuccessResponse response) async {
    if (_path.isNotEmpty && _paymentRequest.isNotEmpty) {
      double amount = _paymentRequest['amount'] / 100;
      await _databaseService
          .setPaymentInfo(
              path: _path,
              amount: amount.toInt(),
              paymentId: response.paymentId ?? "")
          .then((_) {
        RouteHelper.navigateToPath(RouteHelper.videoScreenName, _lessonsData);
      });
    }
    exitRazorPay();
  }

  handleErrorEvent(PaymentFailureResponse response) {
    exitRazorPay();
    showToast(message: response.message ?? "Payment failed");
  }

  createOrder(
      {required Map<String, dynamic> request,
      required Map path,
      required Map lessonsData}) {
    try {
      _paymentRequest = request;
      _path = path;
      _lessonsData = lessonsData;
      _razorpay.open(request);
    } catch (e) {
      showToast(message: AppAlertMessage.paymentError);
    }
  }

  exitRazorPay() {
    _razorpay.clear();
  }
}
