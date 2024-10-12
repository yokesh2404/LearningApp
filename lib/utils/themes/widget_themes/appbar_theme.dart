import 'package:flutter/material.dart';
import 'package:kurups_app/utils/constants/colors.dart';
import 'package:kurups_app/utils/dimension/dimension.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.primary,
    surfaceTintColor: Colors.transparent,
    iconTheme:
        IconThemeData(color: AppColors.textWhite, size: Dimensions.iconMd),
    actionsIconTheme:
        IconThemeData(color: AppColors.textWhite, size: Dimensions.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: AppColors.textWhite),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.dark,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: AppColors.white, size: Dimensions.iconMd),
    actionsIconTheme:
        IconThemeData(color: AppColors.white, size: Dimensions.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.w600, color: AppColors.white),
  );
}
