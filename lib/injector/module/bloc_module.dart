import 'package:kurups_app/injector/injector.dart';
import 'package:kurups_app/screens/chapters/bloc/chapters_bloc.dart';
import 'package:kurups_app/screens/home/bloc/home_bloc.dart';

class BlocModule {
  BlocModule._();

  static void init() {
    var instance = Injector.instance;

    instance
      ..registerLazySingleton<HomeBloc>(() => HomeBloc(
          authServices: Injector.instance(),
          databaseService: Injector.instance(),
          logService: Injector.instance()))
      ..registerFactory<ChaptersBloc>(() => ChaptersBloc(
          authServices: Injector.instance(),
          databaseService: Injector.instance(),
          logService: Injector.instance()));
  }
}
