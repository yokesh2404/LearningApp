import 'package:kurups_app/data/payment_service/payment_service_repo.dart';
import 'package:kurups_app/service/payment_service/payment_service.dart';

class PaymentServiceImpl extends PaymentServiceRepo {
  final PaymentService service;

  PaymentServiceImpl({required this.service});
  @override
  void initRazorPay() async {
    await service.initRazorPay();
  }

  @override
  void openRazorpay({required Map<String, dynamic> paymentRequest}) async {
    initRazorPay();
    await service.createOrder(request: paymentRequest);
  }
}
