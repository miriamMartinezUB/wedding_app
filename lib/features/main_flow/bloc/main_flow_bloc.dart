import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_jc/features/main_flow/drawer_item_id.dart';

part 'main_flow_event.dart';
part 'main_flow_state.dart';

class MainFlowBloc extends Bloc<MainFlowEvent, MainFlowState> {
  MainFlowBloc() : super(MainFlowState(DrawerItemId.home)) {
    on<ChangeMainScreenEvent>((event, emit) {
      emit(MainFlowState(event.itemId));
    });
  }
}
