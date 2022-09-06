import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_flow_event.dart';
part 'main_flow_state.dart';

class MainFlowBloc extends Bloc<MainFlowEvent, MainFlowState> {
  MainFlowBloc() : super(const MainHomeScreenState()) {
    on<ChangeMainScreenEvent>((event, emit) {
      if (event.index == 0) {
        emit(const MainHomeScreenState());
      } else if (event.index == 1) {
        emit(const MainInformationScreenState());
      } else if (event.index == 2) {
        emit(const MainProfileScreenState());
      }
    });
  }
}
