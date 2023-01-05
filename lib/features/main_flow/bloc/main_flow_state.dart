part of 'main_flow_bloc.dart';

class MainFlowState {
  final DrawerItemId itemId;
  late bool isVisibleForAllUsers;

  MainFlowState(this.itemId) {
    isVisibleForAllUsers = itemId != DrawerItemId.summary;
  }
}
