import 'package:flutter/material.dart';
import 'package:kurups_app/entity/quizz/questions_response.dart';
import 'package:kurups_app/provider/quizz/quizz_provider.dart';

abstract class QuizzEvent {}

class GetQuestions extends QuizzEvent {
  final Map path;

  GetQuestions({required this.path});
}

class ClickToSubmit extends QuizzEvent {
  final QuizzProvider provider;
  final BuildContext context;
  final QuestionsResponse response;

  ClickToSubmit({
    required this.provider,
    required this.context,
    required this.response,
  });
}

class TryAgainClick extends QuizzEvent {
  final QuizzProvider provider;
  final BuildContext context;
  final QuestionsResponse response;

  TryAgainClick({
    required this.provider,
    required this.context,
    required this.response,
  });
}
