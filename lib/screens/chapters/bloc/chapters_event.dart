part of 'chapters_bloc.dart';

abstract class ChaptersEvent {}

class GetChaptersBasedId extends ChaptersEvent {
  final String id;

  GetChaptersBasedId({required this.id});
}
