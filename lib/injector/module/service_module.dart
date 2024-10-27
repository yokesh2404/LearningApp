import 'package:kurups_app/injector/injector.dart';
import 'package:kurups_app/service/firebase_services/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:kurups_app/service/firebase_services/firebase_database/firebase_database_service.dart';
import 'package:kurups_app/service/log_services/debug_log_service.dart';
import 'package:kurups_app/service/log_services/log_service.dart';
import 'package:kurups_app/service/payment_service/payment_service.dart';

class ServiceModule {
  ServiceModule._();

  static void init() {
    final injector = Injector.instance;
    injector
      ..registerFactory<LogService>(DebugLogService.new)
      ..registerFactory<FirebaseAuthServices>(() => FirebaseAuthServices())
      ..registerFactory<FirebaseDatabaseService>(
          () => FirebaseDatabaseService())
      ..registerFactory<PaymentService>(() => PaymentService());
  }
}
