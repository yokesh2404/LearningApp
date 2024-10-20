import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kurups_app/data/auth_repo/auth_repo.dart';
import 'package:kurups_app/data/database_repo/database_repo.dart';
import 'package:kurups_app/entity/chapters/chapters_response.dart';
import 'package:kurups_app/service/log_services/log_service.dart';
import 'package:kurups_app/utils/bloc_core/ui_status.dart';

part 'chapters_event.dart';
part 'chapters_state.dart';
part 'chapters_bloc.freezed.dart';

class ChaptersBloc extends Bloc<ChaptersEvent, ChaptersState> {
  late final AuthRepo _authServices;
  late final DatabaseRepo _databaseService;
  late final LogService _logService;
  ChaptersBloc(
      {required AuthRepo authServices,
      required DatabaseRepo databaseService,
      required LogService logService})
      : super(const ChaptersState()) {
    _authServices = authServices;
    _databaseService = databaseService;
    _logService = logService;
    on<ChaptersEvent>((event, emit) {});
    on<GetChaptersBasedId>((event, emit) => getChapters(event, emit));
  }

  void getChapters(GetChaptersBasedId event, Emitter emit) async {
    emit(state.copyWith(status: UIStatus.loading()));
    List<ChaptersResponse> _chapters =
        await _databaseService.getChapteersById(id: event.id);
    if (_chapters.isNotEmpty) {
      emit(state.copyWith(status: UIStatus.loadSuccess(), chapters: _chapters));
    } else {
      emit(state.copyWith(status: UIStatus.loadFailed(), chapters: []));
    }
  }

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }
}
