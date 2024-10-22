import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kurups_app/screens/quiz/bloc/quizz_event.dart';
import 'package:kurups_app/service/firebase_services/firebase_database/firebase_database_service.dart';
import 'package:kurups_app/service/log_services/log_service.dart';
import 'package:kurups_app/utils/bloc_core/ui_status.dart';

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
    on<QuizzEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
