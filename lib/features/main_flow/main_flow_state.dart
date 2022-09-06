part of 'main_flow_bloc.dart';

@immutable
abstract class MainFlowState {
  final int index;

  const MainFlowState(this.index);
}

class MainHomeScreenState extends MainFlowState {
  const MainHomeScreenState() : super(0);
}

class MainInformationScreenState extends MainFlowState {
  const MainInformationScreenState() : super(1);
}

class MainProfileScreenState extends MainFlowState {
  const MainProfileScreenState() : super(2);
}
