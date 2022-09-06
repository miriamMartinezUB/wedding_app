import 'package:flutter/material.dart';
import 'package:wedding_jc/features/main_flow/main_page.dart';
import 'package:wedding_jc/features/splash_page.dart';
import 'package:wedding_jc/resources/routes.dart';

class WeddingRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const MainPage());
      default:
        return MaterialPageRoute(builder: (context) => const SplashPage());
    }
  }
}
