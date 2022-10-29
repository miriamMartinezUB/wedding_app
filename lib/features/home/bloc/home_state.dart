part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadState extends HomeState {
  final List<Task> tasks;
  final List<String> doneTasksIds;

  HomeLoadState({required this.tasks, required this.doneTasksIds});
}
