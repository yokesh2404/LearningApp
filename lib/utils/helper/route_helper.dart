import 'package:go_router/go_router.dart';
import 'package:kurups_app/screens/chapters/chapters.dart';
import 'package:kurups_app/screens/lessons/subchapter.dart';
import 'package:kurups_app/screens/home/view/home.dart';
import 'package:kurups_app/screens/login/login.dart';
import 'package:kurups_app/screens/register/register.dart';
import 'package:kurups_app/screens/splash/splash.dart';

class RouteHelper {
  RouteHelper._();

  static const String splashScreenName = 'dashboard';
  static const String splashScreenPath = '/';
  static const String loginScreenName = 'login';
  static const String loginScreenPath = '/login';
  static const String registerScreenName = 'register';
  static const String registerScreenPath = '/register';
  static const String homeScreenName = 'home';
  static const String homeScreenPath = '/home';
  static const String courseChapterName = 'courseChapter';
  static const String courseChapterPath = '/courseChapter';
  static const String lessonsName = 'lessons';
  static const String lessonsPath = '/lessons';

  static GoRouter get router => _router;
  static final _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: splashScreenName,
        path: splashScreenPath,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        name: loginScreenName,
        path: loginScreenPath,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        name: registerScreenName,
        path: registerScreenPath,
        builder: (context, state) {
          return const RegisterPage();
        },
      ),
      GoRoute(
        name: homeScreenName,
        path: homeScreenPath,
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        name: courseChapterName,
        path: courseChapterPath,
        builder: (context, state) {
          return BasicPage(
            chapterId: state.extra.toString(),
          );
        },
      ),
      GoRoute(
        name: lessonsName,
        path: lessonsPath,
        builder: (context, state) {
          return LessonsScreen(
            path: state.extra as Map,
          );
        },
      )
    ],
  );
}
