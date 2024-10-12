import 'package:flutter/material.dart';
import 'package:kurups_app/utils/constants/colors.dart';
import 'package:kurups_app/utils/dimension/dimension.dart';

class AppDialogTheme {
  AppDialogTheme._();

  static DialogTheme dialogLightTheme = DialogTheme(
    backgroundColor: AppColors.lightContainer,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimensions.size_06),
    ),
  );

  static DialogTheme dialogDarkTheme = DialogTheme(
    backgroundColor: AppColors.dark,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimensions.size_06),
    ),
  );
}
