part of 'main_flow_bloc.dart';

@immutable
abstract class MainFlowEvent {}

class ChangeMainScreenEvent extends MainFlowEvent {
  final int index;
  ChangeMainScreenEvent({required this.index});
}
