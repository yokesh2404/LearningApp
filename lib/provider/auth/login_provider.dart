import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  updateLoadingState(bool state) {
    _isLoading = state;
    notifyListeners();
  }

  @override
  void removeListener(VoidCallback listener) {
    super.removeListener(listener);
  }
}
