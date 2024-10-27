import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kurups_app/firebase_options.dart';
import 'package:kurups_app/injector/injector.dart';
import 'package:kurups_app/screens/quiz/bloc/quizz_bloc.dart';

//import 'package:kurups_app/home/home.dart';
import 'package:kurups_app/screens/splash/splash.dart';
import 'package:kurups_app/utils/bloc_core/bloc_observer.dart';
import 'package:kurups_app/utils/dimension/app_sizes.dart';
import 'package:kurups_app/utils/helper/route_helper.dart';
import 'package:kurups_app/utils/helper/shared_pref_controller.dart';
import 'package:kurups_app/utils/helper/theme_helper.dart';
//import 'package:kurups_app/splash/splash.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:kurups_app/otpscreen/otpscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPrefController.instance.init();

  Injector.init();

  await Injector.instance.allReady();

  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.instance.getScreenSize(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => Injector.instance<QuizzBloc>(),
          )
        ],
        child: MaterialApp.router(
          // localizationsDelegates: AppLocalizations.localizationsDelegates,
          // supportedLocales: AppLocalizations.supportedLocales,
          themeMode: Theme.of(context).brightness == Brightness.dark
              ? ThemeMode.dark
              : ThemeMode.light,
          theme: ThemeHelper.lightTheme,
          darkTheme: ThemeHelper.darkTheme,
          routerConfig: RouteHelper.router,
          debugShowCheckedModeBanner: false,
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
