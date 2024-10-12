// lib/colors.dart
import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color.fromARGB(255, 16, 104, 103); //Teal
  static const Color secondary = Color(0xFF03DAC6); // teal
  static const Color secondaryVariant = Color(0xFF018786); // Dark Teal
  static const Color background = Color(0xFFF5F5F5); // Light Background
  static const Color surface = Color(0xFFFFFFFF); // White Surface
  static const Color error = Color(0xFFB00020); // Error Color

  static const Color onPrimary = Color(0xFFFFFFFF); // Text on  teal background
  static const Color onSecondary =
      Color.fromARGB(255, 185, 213, 213); // Text on white Secondary

  static const Color onSurface = Color(0xFF000000); // Text on Surface
  static const Color onError = Color(0xFFFFFFFF); // Text on Error
  static const Color primaryVariant = Color(0xFF3700B3); // Dark Purple
  static const Color purple = Color.fromARGB(94, 89, 91, 245); // Dark Purple
  static const Color onBackground = Color(0xFF000000); // Text on Background

  static const Color textPrimary = Color(0xFF120101);
  static const Color textSecondary = Color(0xFF191D23);
  static const Color textPrimaryDark = Color(0xFFFEFEFE);
  static const Color textSecondaryDark = Color(0xFFFEFEFE);
  static const Color textWhite = Color(0xFFFEFEFE);
  static const Color textGrey = Colors.grey;
  static const Color accent = Color(0xFFFFEEEE);

  // Background colors
  static const Color light = Color(0xFFFEFEFE);
  static Color lightSecondary = light.withOpacity(0.9);
  static const Color dark = Color(0xFF272727);
  static Color darkSecondary = dark.withOpacity(0.9);

  static Color lightRedColor = const Color.fromARGB(255, 222, 100, 100);

  // Background Container colors
  static const Color lightContainer = Color(0xFFFFFFFF);
  static Color darkContainer = AppColors.white.withOpacity(0.1);
  static const Color appBarColorStart = Color(0xFFAF0061);
  static const Color appBarColorEnd = Color(0xFF581855);
  static const Color textPurple = Color(0xFF345C74);
  // static const Color button = Color(0xFF345C74);

  // Button colors
  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = Color(0xFFFDDDF3);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border colors
  static const Color borderPrimary = Color(0xFFCCD1D6);

  // Error and validation colors
  // static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color.fromARGB(255, 8, 50, 92);

  // Neutral Shades
  static const Color black = Color(0xFF000000);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
  static const Color green = Colors.green;
  static const Color blue = Colors.blue;
  static const Color darkBlue = Color.fromARGB(255, 13, 25, 117);
  static const Color darkerBlue = Color.fromARGB(255, 21, 53, 124);
  static const Color blueShade = Color.fromRGBO(100, 181, 246, 1);
  static const Color red = Colors.red;
  static const Color CountryBackground = Color(0xffe5e5e5);
  static const Color selectedProfileBackground = Color.fromRGBO(175, 0, 97, .1);
  static const Color selectedSeatProfileContainer =
      Color.fromRGBO(80, 177, 87, 1);
}
