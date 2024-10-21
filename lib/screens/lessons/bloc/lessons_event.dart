part of 'lessons_bloc.dart';

abstract class LessonsEvent {}

class GetLessons extends LessonsEvent {
  final Map databasePath;

  GetLessons({required this.databasePath});
}
