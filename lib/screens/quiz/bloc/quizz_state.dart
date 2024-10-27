part of 'quizz_bloc.dart';

@freezed
class QuizzState with _$QuizzState {
  const factory QuizzState(
      {@Default(UIStatus.initial()) UIStatus status,
      @Default(false) bool startTimer,
      QuestionsResponse? questionsResponse}) = _QuizzState;
}
