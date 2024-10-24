import 'package:flutter/material.dart';

class QuizzProvider extends ChangeNotifier {
  Map<int, String> _userAns = {};
  Map<int, String> get userAns => _userAns;

  updatuserAns(
      {required int quesionIndex,
      required int ansIndex,
      required List<String> answers}) {
    if (_userAns[quesionIndex] == null) {
      _userAns[quesionIndex] = answers[ansIndex];
    }
    print(userAns.length);
    notifyListeners();
  }

  bool isCorrectAns(int quesionIndex, int ansIndex, List<String> answers) {
    return userAns[quesionIndex] == answers[ansIndex];
  }

  bool checkAnsisCorrect(int quesionIndex, String correctAnswere) {
    return userAns[quesionIndex] == correctAnswere;
  }
}
