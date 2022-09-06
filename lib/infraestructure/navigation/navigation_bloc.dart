import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_jc/infraestructure/locator_setup.dart';
import 'package:wedding_jc/infraestructure/navigation/navigation_event.dart';
import 'package:wedding_jc/infraestructure/navigation/navigator_service.dart';
import 'package:wedding_jc/resources/routes.dart';

class NavigatorBloc extends Bloc<NavigationEvent, dynamic> {
  final NavigationService _navigationService = locator<NavigationService>();

  NavigatorBloc(initialState) : super(initialState) {
    on(
      (event, emit) {
        if (event is HomeNavigationEvent) {
          _navigationService.replace(Routes.home);
        } else if (event is BackNavigationEvent) {
          _navigationService.goBack();
        } else {
          event as PushScreenNavigationEvent;
          _navigationService.navigateTo(event.model.route, arguments: event.model.arguments);
        }
      },
    );
  }
}
