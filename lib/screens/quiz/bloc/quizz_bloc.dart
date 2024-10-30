import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:kurups_app/entity/quizz/questions_response.dart';
import 'package:kurups_app/screens/quiz/bloc/quizz_event.dart';
import 'package:kurups_app/provider/quizz/quizz_provider.dart';
import 'package:kurups_app/service/firebase_services/firebase_database/firebase_database_service.dart';
import 'package:kurups_app/service/log_services/log_service.dart';
import 'package:kurups_app/utils/bloc_core/ui_status.dart';
import 'package:kurups_app/utils/helper/route_helper.dart';
import 'package:kurups_app/widgets/full_screen_dialog.dart';
import 'package:kurups_app/widgets/quizz_alert.dart';

part 'quizz_state.dart';
part 'quizz_bloc.freezed.dart';

class QuizzBloc extends Bloc<QuizzEvent, QuizzState> {
  late final FirebaseDatabaseService _databaseService;
  late final LogService _logService;

  QuizzBloc(
      {required FirebaseDatabaseService databaseService,
      required LogService logService})
      : super(const QuizzState()) {
    _databaseService = databaseService;
    _logService = logService;

    on<QuizzEvent>((event, emit) {});
    on<GetQuestions>((event, emit) async {
      emit(state.copyWith(status: UIStatus.loading()));
      QuestionsResponse response =
          await _databaseService.getQuestionsById(path: event.path);

      if (response.data != null && response.data!.isNotEmpty) {
        emit(state.copyWith(
            status: UIStatus.loadSuccess(), questionsResponse: response));
        print('Updated State: ${state.questionsResponse}');
      } else {
        emit(state.copyWith(
            status: UIStatus.loadFailed(),
            questionsResponse: QuestionsResponse()));
      }
    });

    on<ClickToSubmit>((event, emit) {
      return showDialog(event, emit);
    });
    on<TryAgainClick>((event, emit) {
      return tryAgainClick(event, emit);
    });
  }

  showDialog(ClickToSubmit event, Emitter emit) {
    QuizzProvider _provider = event.provider;
    final response = state.questionsResponse!;

    FullScreenDialog.showFullScreenPopup(event.context,
        child: QuizzAlert(
          showExit: false,
          correctAnswer: event.provider
              .getCorrectAnswers(state.questionsResponse!.data ?? []),
          incorrectAnswer: event.provider
              .getInCorrectAnswers(state.questionsResponse!.data ?? []),
          onTryAgain: () {},
          onGoHome: () {
            event.context.pop();
            event.context.pop();
          },
          onAnswerAndHints: () {
            event.context.pop();

            event.context.pushReplacementNamed(RouteHelper.answereScreenName,
                extra: response.data);
          },
          bloc: this,
          provider: _provider,
        ));
  }

  void tryAgainClick(TryAgainClick event, Emitter emit) {
    QuizzProvider _provider = event.provider;
    final response = state.questionsResponse!;
    event.context.pop();
    _provider.resetUserAns();
    log(jsonEncode(response.data));

    // if (response.data != null && response.data!.isNotEmpty) {
    //   // response.data!.shuffle();
    // }
    emit(state.copyWith(
        questionsResponse: response, startTimer: !state.startTimer));
  }

  stopTimer(StartStopTimer event, Emitter emit) {
    emit(state.copyWith(startTimer: event.timerStatus));
  }
}
