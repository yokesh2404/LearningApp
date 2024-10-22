import 'package:flutter/material.dart';

class QuizzProvider extends ChangeNotifier {
  Map<int, int> _userAns = {};
  Map<int, int> get userAns => _userAns;

  updatuserAns({required int quesionIndex, required int ansIndex}) {
    _userAns[quesionIndex] = ansIndex;
    notifyListeners();
  }

  bool isCorrectAns(int quesionIndex) {
    return userAns[quesionIndex] == 3;
  }

  int ansIndex(int quesionIndex) {
    return userAns[quesionIndex] ?? 0;
  }
}
