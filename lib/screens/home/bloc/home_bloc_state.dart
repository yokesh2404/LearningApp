part of 'home_bloc.dart';

@freezed
class HomeBlocState with _$HomeBlocState {
  const factory HomeBlocState(
      {@Default(UIInitial()) UIStatus status,
      UserDetails? userDetails,
      List<BasicConcept>? courseList}) = _HomeBlocState;
}
