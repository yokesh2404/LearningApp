import 'package:kurups_app/injector/injector.dart';
import 'package:kurups_app/screens/chapters/bloc/chapters_bloc.dart';
import 'package:kurups_app/screens/home/bloc/home_bloc.dart';
import 'package:kurups_app/screens/lessons/bloc/lessons_bloc.dart';
import 'package:kurups_app/screens/quiz/bloc/quizz_bloc.dart';

class BlocModule {
  BlocModule._();

  static void init() {
    var instance = Injector.instance;

    instance
      ..registerFactory<HomeBloc>(() => HomeBloc(
          authServices: Injector.instance(),
          databaseService: Injector.instance(),
          logService: Injector.instance()))
      ..registerFactory<ChaptersBloc>(() => ChaptersBloc(
          authServices: Injector.instance(),
          databaseService: Injector.instance(),
          logService: Injector.instance()))
      ..registerFactory<LessonsBloc>(() => LessonsBloc(
          authServices: Injector.instance(),
          databaseService: Injector.instance(),
          logService: Injector.instance()))
      ..registerFactory<QuizzBloc>(() => QuizzBloc(
          databaseService: Injector.instance(),
          logService: Injector.instance()));
  }
}
