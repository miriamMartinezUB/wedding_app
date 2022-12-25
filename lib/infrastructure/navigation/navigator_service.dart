import 'package:flutter/material.dart';
import 'package:wedding_jc/infrastructure/auth/auth_service.dart';
import 'package:wedding_jc/infrastructure/locator_setup.dart';
import 'package:wedding_jc/resources/routes.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> replace(String routeName) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
  }

  void goBack({dynamic arguments}) {
    if (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop(arguments);
    }
  }

  Future<dynamic> goToInitialRoute() async {
    locator<AuthService>().isAuthenticated$.distinct().listen((isAuthenticated) {
      if (isAuthenticated) {
        replace(Routes.home);
      } else {
        replace(Routes.signUp);
      }
    });
  }
}
