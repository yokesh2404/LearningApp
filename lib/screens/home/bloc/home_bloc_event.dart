part of 'home_bloc.dart';

abstract class HomeBlocEvent {}

class GetHomeData extends HomeBlocEvent {}

class GetHomeCourses extends HomeBlocEvent {}

class ClickCourse extends HomeBlocEvent {
  final String id;
  final BuildContext context;

  ClickCourse({
    required this.id,
    required this.context,
  });
}
