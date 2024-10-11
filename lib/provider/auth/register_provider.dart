import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  updateLoadingState(bool state) {
    _isLoading = state;
    notifyListeners();
  }
}
