part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitEvent extends HomeEvent {}

class HomeDoneTaskEvent extends HomeEvent {
  final String taskId;

  HomeDoneTaskEvent({required this.taskId});
}
