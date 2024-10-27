import 'package:kurups_app/data/auth_repo/auth_repo.dart';
import 'package:kurups_app/data/auth_repo/auth_repo_impl.dart';
import 'package:kurups_app/data/database_repo/database_repo.dart';
import 'package:kurups_app/data/database_repo/database_repo_impl.dart';
import 'package:kurups_app/data/payment_service/payment_service_impl.dart';
import 'package:kurups_app/data/payment_service/payment_service_repo.dart';
import 'package:kurups_app/injector/injector.dart';

class RepoModule {
  RepoModule._();

  static void init() {
    final instance = Injector.instance;
    instance
      ..registerLazySingleton<AuthRepo>(
          () => AuthRepoImpl(authServices: Injector.instance()))
      ..registerLazySingleton<DatabaseRepo>(
          () => DatabaseRepoImpl(service: Injector.instance()))
      ..registerLazySingleton<PaymentServiceRepo>(
          () => PaymentServiceImpl(service: Injector.instance()));
  }
}
