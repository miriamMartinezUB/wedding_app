import 'package:wedding_jc/infrastructure/navigation/navigation_modal.dart';

abstract class NavigationEvent {}

class BackNavigationEvent extends NavigationEvent {
  BackNavigationEvent();
}

class HomeNavigationEvent extends NavigationEvent {
  HomeNavigationEvent();
}

class PushScreenNavigationEvent extends NavigationEvent {
  final NavigationModel model;
  PushScreenNavigationEvent({required this.model});
}
