import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kurups_app/screens/login/login.dart';
import 'package:kurups_app/utils/constants/colors.dart';
import 'package:kurups_app/utils/constants/shared_pref_keys.dart';
import 'package:kurups_app/utils/helper/route_helper.dart';
import 'package:kurups_app/utils/helper/shared_pref_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    var isLoggedIn = await SharedPrefController.instance
        .getBoolData(key: SharedPrefKeys.isLoggednIn);
    await Timer(
      const Duration(seconds: 3),
      () async {
        if (isLoggedIn) {
          GoRouter.of(context).go(RouteHelper.homeScreenPath);
        } else {
          GoRouter.of(context).go(RouteHelper.loginScreenPath);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center items vertically
          crossAxisAlignment:
              CrossAxisAlignment.center, // Center items horizontally
          children: [
            // SizedBox(
            //   width: 100, // Width of the logo container
            //   height: 100, // Height of the logo container
            Image.asset('assets/images/logo 1.png',
                height: 100, width: 100), // Path to your logo image
            //),
            const SizedBox(height: 20), // Space between logo and text
            const Text(
              'Welcome to KurupsApp',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
