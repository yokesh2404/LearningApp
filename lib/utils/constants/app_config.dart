import 'package:flutter/material.dart';
import 'package:kurups_app/entity/common/drawer_list_tile.dart';
import 'package:kurups_app/utils/constants/app_string.dart';
import 'package:kurups_app/utils/constants/enums.dart';

class AppConfig {
  AppConfig._();

  static List<DrawerListTile> drawerlistTile = [
    DrawerListTile(icons: Icons.book, title: AppString.myCourses),
    DrawerListTile(icons: Icons.settings, title: AppString.settings),
    DrawerListTile(icons: Icons.info, title: AppString.about),
    DrawerListTile(icons: Icons.exit_to_app, title: AppString.signOut)
  ];
  static const EnvironmentMode environmentMode = EnvironmentMode.dev;
  static Map answereOptions = {0: "A", 1: "B", 2: "C", 3: "D"};

  static const String razorPayKey =
      environmentMode == EnvironmentMode.dev ? 'rzp_test_1DP5mmOlF5G5ag' : '';
}
