import 'package:flutter/material.dart';
import 'package:kurups_app/utils/constants/colors.dart';
import 'package:kurups_app/utils/themes/widget_themes/appbar_theme.dart';
import 'package:kurups_app/utils/themes/widget_themes/bottom_sheet_theme.dart';
import 'package:kurups_app/utils/themes/widget_themes/card_theme.dart';
import 'package:kurups_app/utils/themes/widget_themes/checkbox_theme.dart';
import 'package:kurups_app/utils/themes/widget_themes/chip_theme.dart';
import 'package:kurups_app/utils/themes/widget_themes/dialog_theme.dart';
import 'package:kurups_app/utils/themes/widget_themes/elevated_button_theme.dart';
import 'package:kurups_app/utils/themes/widget_themes/listtile_theme.dart';
import 'package:kurups_app/utils/themes/widget_themes/naw_drawer_theme.dart';
import 'package:kurups_app/utils/themes/widget_themes/tabbar_theme.dart';
import 'package:kurups_app/utils/themes/widget_themes/text_field_theme.dart';
import 'package:kurups_app/utils/themes/widget_themes/text_theme.dart';

class ThemeHelper {
  ThemeHelper._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Montserrat',
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.white,
      cardColor: AppColors.white,
      textTheme: AppTextTheme.lightTextTheme,
      chipTheme: AppChipTheme.lightChipTheme,
      appBarTheme: TAppBarTheme.lightAppBarTheme,
      checkboxTheme: AppCheckboxTheme.lightCheckboxTheme,
      bottomSheetTheme: AppBottomSheetTheme.lightBottomSheetTheme,
      elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
      inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme,
      drawerTheme: AppDrawerTheme.lightdrawerTheme,
      listTileTheme: AppListTileTheme.lightTileTheme,
      cardTheme: AppCardTheme.cardLightTheme,
      tabBarTheme: AppTabBarTheme.tabbarLightTheme,
      dialogTheme: AppDialogTheme.dialogLightTheme);

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Montserrat',
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.black,
      cardColor: AppColors.black,
      textTheme: AppTextTheme.darkTextTheme,
      chipTheme: AppChipTheme.darkChipTheme,
      appBarTheme: TAppBarTheme.darkAppBarTheme,
      checkboxTheme: AppCheckboxTheme.darkCheckboxTheme,
      bottomSheetTheme: AppBottomSheetTheme.darkBottomSheetTheme,
      elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
      inputDecorationTheme: AppTextFormFieldTheme.darkInputDecorationTheme,
      drawerTheme: AppDrawerTheme.darkdrawerTheme,
      listTileTheme: AppListTileTheme.darkTileTheme,
      cardTheme: AppCardTheme.cardDarkTheme,
      tabBarTheme: AppTabBarTheme.tabbarDarkTheme,
      dialogTheme: AppDialogTheme.dialogDarkTheme);
}
