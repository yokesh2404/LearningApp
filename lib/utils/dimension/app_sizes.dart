import 'package:flutter/material.dart';

class AppSizes {
  AppSizes._privateConstructor();

  static final AppSizes instance = AppSizes._privateConstructor();

  static Size? _screenSize;

  Size get screenSize {
    if (_screenSize != null) _screenSize;

    return _screenSize!;
  }

  void getScreenSize(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
  }
}
