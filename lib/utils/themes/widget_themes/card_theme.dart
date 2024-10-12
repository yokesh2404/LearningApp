import 'package:flutter/material.dart';
import 'package:kurups_app/utils/constants/colors.dart';

class AppCardTheme {
  AppCardTheme._();

  static const cardLightTheme = CardTheme(color: AppColors.lightContainer);

  static CardTheme cardDarkTheme = const CardTheme(color: AppColors.dark);
}
