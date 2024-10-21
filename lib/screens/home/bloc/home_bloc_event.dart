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

class DrawerClickEvent extends HomeBlocEvent {
  final int index;
  final BuildContext context;
  DrawerClickEvent({
    required this.index,
    required this.context,
  });
}
