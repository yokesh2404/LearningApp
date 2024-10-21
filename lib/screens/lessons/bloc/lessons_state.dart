part of 'lessons_bloc.dart';

@freezed
class LessonsState with _$LessonsState {
  const factory LessonsState({
    @Default(UIStatus.initial()) UIStatus status,
    LessonsResponse? lessonsResponse,
  }) = _LessonsState;
}
