abstract class PaymentServiceRepo {
  void initRazorPay();

  void openRazorpay({required Map<String, dynamic> paymentRequest});
}
