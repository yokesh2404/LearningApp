import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kurups_app/data/auth_repo/auth_repo.dart';
import 'package:kurups_app/data/database_repo/database_repo.dart';
import 'package:kurups_app/entity/lessons/lessons_response.dart';
import 'package:kurups_app/service/log_services/log_service.dart';
import 'package:kurups_app/utils/bloc_core/ui_status.dart';

part 'lessons_event.dart';
part 'lessons_state.dart';
part 'lessons_bloc.freezed.dart';

class LessonsBloc extends Bloc<LessonsEvent, LessonsState> {
  late final AuthRepo _authServices;
  late final DatabaseRepo _databaseService;
  late final LogService _logService;
  LessonsBloc(
      {required AuthRepo authServices,
      required DatabaseRepo databaseService,
      required LogService logService})
      : super(LessonsState()) {
    _authServices = authServices;
    _databaseService = databaseService;
    _logService = logService;
    on<LessonsEvent>((event, emit) {});
    on<GetLessons>((event, emit) => getLessons(event, emit));
  }

  void getLessons(GetLessons event, Emitter emit) async {
    var course = event.databasePath["course"];
    var path = event.databasePath["selectedChapter"];
    emit(state.copyWith(status: UIStatus.loading()));
    LessonsResponse response =
        await _databaseService.getLessonsById(docId: course, collection: path);

    if (response.data != null) {
      emit(state.copyWith(
          status: UIStatus.loadSuccess(), lessonsResponse: response));
    } else {
      emit(state.copyWith(status: UIStatus.loadFailed()));
    }
  }
}
