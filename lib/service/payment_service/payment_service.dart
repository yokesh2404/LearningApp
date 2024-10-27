import 'package:kurups_app/utils/constants/app_string.dart';
import 'package:kurups_app/utils/helper/app_toast_helper.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentService {
  PaymentService();
  Razorpay _razorpay = Razorpay();
  initRazorPay() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handleSuccessEvent);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handleSuccessEvent);
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handleSuccessEvent);
  }

  handleSuccessEvent(PaymentSuccessResponse response) {
    print(response);
  }

  handleErrorEvent(PaymentFailureResponse response) {}

  createOrder({required Map<String, dynamic> request}) {
    // var options = {
    //   'key': 'rzp_test_1DP5mmOlF5G5ag',
    //   'amount': 100,
    //   'name': 'kurups maths',
    //   'prefill': {'contact': '1234567890', 'email': 'text@gmail.com'},
    //   'external': {
    //     'wallets': ['paytm']
    //   }
    // };
    try {
      _razorpay.open(request);
    } catch (e) {
      showToast(message: AppAlertMessage.paymentError);
    }
  }

  exitRazorPay() {
    _razorpay.clear();
  }
}
