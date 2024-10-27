part of 'lessons_bloc.dart';

abstract class LessonsEvent {}

class GetLessons extends LessonsEvent {
  final Map databasePath;

  GetLessons({required this.databasePath});
}

class ClickLessons extends LessonsEvent {
  final Map databasePath;
  final LessonsData data;
  final BuildContext context;

  ClickLessons({
    required this.databasePath,
    required this.data,
    required this.context,
  });
}

class PaymentClick extends LessonsEvent {
  final Map databasePath;
  final LessonsData data;
  final PaymentDetails paymentDetails;
  final BuildContext context;

  PaymentClick({
    required this.databasePath,
    required this.data,
    required this.context,
    required this.paymentDetails,
  });
}
