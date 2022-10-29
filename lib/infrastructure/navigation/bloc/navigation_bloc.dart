import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_jc/infrastructure/locator_setup.dart';
import 'package:wedding_jc/infrastructure/navigation/bloc/navigation_event.dart';
import 'package:wedding_jc/infrastructure/navigation/navigator_service.dart';
import 'package:wedding_jc/resources/routes.dart';

class NavigatorBloc extends Bloc<NavigationEvent, dynamic> {
  final NavigationService _navigationService = locator<NavigationService>();

  NavigatorBloc(initialState) : super(initialState) {
    on<HomeNavigationEvent>((event, emit) => _navigationService.replace(Routes.home));
    on<BackNavigationEvent>((event, emit) => _navigationService.goBack());
    on<InitialRouteNavigationEvent>((event, emit) => _navigationService.goToInitialRoute());
    on<PushScreenNavigationEvent>((event, emit) => _navigationService.navigateTo(
          event.model.route,
          arguments: event.model.arguments,
        ));
  }
}
