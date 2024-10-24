import 'package:flutter/material.dart';
import 'package:kurups_app/screens/quiz/provider/quizz_provider.dart';

abstract class QuizzEvent {}

class GetQuestions extends QuizzEvent {
  final Map path;

  GetQuestions({required this.path});
}

class ClickToSubmit extends QuizzEvent {
  final QuizzProvider provider;
  final BuildContext context;

  ClickToSubmit({required this.provider, required this.context});
}
