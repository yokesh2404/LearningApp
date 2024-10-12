import 'package:get_it/get_it.dart';
import 'package:kurups_app/injector/module/bloc_module.dart';
import 'package:kurups_app/injector/module/repo_module.dart';
import 'package:kurups_app/injector/module/service_module.dart';

class Injector {
  Injector._();
  static GetIt instance = GetIt.instance;

  static void init() {
    // DioModule.setup();
    ServiceModule.init();
    RepoModule.init();
    BlocModule.init();
  }

  static void reset() {
    instance.reset();
  }

  static void resetLazySingleton() {
    instance.resetLazySingleton();
  }
}
