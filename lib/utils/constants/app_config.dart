import 'package:flutter/material.dart';
import 'package:kurups_app/entity/common/drawer_list_tile.dart';
import 'package:kurups_app/utils/constants/app_string.dart';

class AppConfig {
  AppConfig._();

  static List<DrawerListTile> drawerlistTile = [
    DrawerListTile(icons: Icons.book, title: AppString.myCourses),
    DrawerListTile(icons: Icons.settings, title: AppString.settings),
    DrawerListTile(icons: Icons.info, title: AppString.about),
    DrawerListTile(icons: Icons.exit_to_app, title: AppString.signOut)
  ];
}
