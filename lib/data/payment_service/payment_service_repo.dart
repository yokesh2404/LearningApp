abstract class PaymentServiceRepo {
  void initRazorPay();

  void openRazorpay(
      {required Map<String, dynamic> paymentRequest,
      required Map path,
      required Map lessonsData});
}
