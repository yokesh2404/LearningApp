import 'package:flutter/material.dart';
import 'package:kurups_app/entity/quizz/questions_response.dart';

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

  void resetUserAns() {
    _userAns = {};
    notifyListeners();
  }

  int getCorrectAnswers(List<QuestionsData> data) {
    int count = 0;
    if (data.isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        if (userAns[i] != null && userAns[i] == data[i].correctAnswere) {
          count++;
        }
      }
    }
    return count;
  }

  int getInCorrectAnswers(List<QuestionsData> data) {
    int count = 0;
    if (data.isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        if (userAns[i] != null && userAns[i] != data[i].correctAnswere) {
          count++;
        }
      }
    }
    return count;
  }
}
