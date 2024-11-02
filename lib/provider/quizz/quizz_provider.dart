import 'package:flutter/material.dart';
import 'package:kurups_app/entity/common/selected_ans_data.dart';
import 'package:kurups_app/entity/quizz/questions_response.dart';

class QuizzProvider extends ChangeNotifier {
  Map<int, String> _userAns = {};
  Map<int, String> get userAns => _userAns;
  Map<int, List<SelectedAnsData>> _selectedAns = {};
  Map<int, List<SelectedAnsData>> get selectedAns => _selectedAns;

  updatuserAns(
      {required int quesionIndex,
      required int ansIndex,
      required List<String> answers}) {
    if (_userAns[quesionIndex] == null) {
      _userAns[quesionIndex] = answers[ansIndex];
    }
    // print(userAns.length);
    notifyListeners();
  }

  updatselectedAns(
      {required int quesionIndex,
      required int answerColumnIndex,
      required List<String> answersList,
      required String answere}) {
    var data = selectedAns[quesionIndex] ?? [];
    if (data.isNotEmpty &&
        data
            .where((e) =>
                e.answereColumn != null && e.answereColumn == answerColumnIndex)
            .toList()
            .isEmpty) {
      data.insert(
          answerColumnIndex,
          SelectedAnsData(
              answereColumn: answerColumnIndex, selectedAns: answere));
      _selectedAns[quesionIndex] = data;
    } else {
      if (data.isEmpty) {
        data.add(SelectedAnsData(
            answereColumn: answerColumnIndex, selectedAns: answere));
        _selectedAns[quesionIndex] = data;
      }
    }
    // print(selectedAns[quesionIndex]);
    // _selectedAns[quesionIndex]=;
    // if (_userAns[quesionIndex] == null) {
    //   _userAns[quesionIndex] = answers[ansIndex];
    // }
    // print(userAns.length);
    notifyListeners();
  }

  bool isCorrectAns(
    int quesionIndex,
    int ansIndex,
    List<String> answers,
    int ansColumIndex,
  ) {
    var _data = selectedAns[quesionIndex] ?? [];
    if (_data.isNotEmpty) {
      var _tempData = _data.firstWhere(
        (ele) =>
            ele.answereColumn != null && ele.answereColumn == ansColumIndex,
        orElse: () => SelectedAnsData(),
      );
      if (_tempData.selectedAns != null &&
          _tempData.selectedAns == answers[ansIndex]) {
        return true;
      }
      return false;
    }
    return false;
  }

  bool checkAnsisCorrect(
    int quesionIndex,
    String correctAnswere,
    int ansColumIndex,
  ) {
    var _data = selectedAns[quesionIndex] ?? [];
    if (_data.isNotEmpty) {
      var _tempData = _data.firstWhere(
        (ele) =>
            ele.answereColumn != null && ele.answereColumn == ansColumIndex,
        orElse: () => SelectedAnsData(),
      );
      if (_tempData.selectedAns != null &&
          _tempData.selectedAns == correctAnswere) {
        return true;
      }
      return false;
    }

    return false;
  }

  void resetUserAns() {
    _userAns = {};
    _selectedAns = {};
    notifyListeners();
  }

  int getCorrectAnswers(List<QuestionsData> data) {
    int count = 0;
    if (data.isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        List<bool> isValid = [];
        var _tempData = selectedAns[i] ?? [];
        for (int j = 0; j < data[i].answers!.length; j++) {
          if (_tempData.isNotEmpty &&
              _tempData
                  .where((e) =>
                      e.answereColumn != null &&
                      e.answereColumn == j &&
                      e.selectedAns == data[i].answers![j].correctAnswer)
                  .toList()
                  .isNotEmpty) {
            isValid.add(true);
          } else {
            isValid.add(false);
          }
        }

        if (isValid.every((e) => e == true)) {
          count++;
        }
        // if (userAns[i] != null && userAns[i] == data[i].correctAnswere) {
        //   count++;
        // }
      }
    }
    return count;
  }

  int getInCorrectAnswers(List<QuestionsData> data) {
    int count = 0;
    if (data.isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        List<bool> isValid = [];
        var _tempData = selectedAns[i] ?? [];
        for (int j = 0; j < data[i].answers!.length; j++) {
          if (_tempData.isNotEmpty &&
              _tempData
                  .where((e) =>
                      e.answereColumn != null &&
                      e.answereColumn == j &&
                      e.selectedAns == data[i].answers![j].correctAnswer)
                  .toList()
                  .isNotEmpty) {
            isValid.add(true);
          } else {
            isValid.add(false);
          }
        }
        print(isValid);
        if (isValid.any((e) => e == false)) {
          count++;
        }
        // if (userAns[i] != null && userAns[i] == data[i].correctAnswere) {
        //   count++;
        // }
      }
    }
    return count;
  }
}
