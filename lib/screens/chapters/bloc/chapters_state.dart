part of 'chapters_bloc.dart';

@freezed
class ChaptersState with _$ChaptersState {
  const factory ChaptersState(
      {@Default(UIInitial()) UIStatus status,
      @Default([]) List<ChaptersResponse> chapters}) = _ChaptersState;
}
