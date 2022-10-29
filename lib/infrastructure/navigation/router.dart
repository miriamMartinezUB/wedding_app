import 'package:flutter/material.dart';
import 'package:wedding_jc/features/errors/not_implemented_page.dart';
import 'package:wedding_jc/features/errors/update_ready_page.dart';
import 'package:wedding_jc/features/main_flow/main_page.dart';
import 'package:wedding_jc/features/persons/pages/add_persona_details_page.dart';
import 'package:wedding_jc/features/persons/pages/persons.dart';
import 'package:wedding_jc/features/splash/splash_page.dart';
import 'package:wedding_jc/resources/routes.dart';

class WeddingRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const MainPage());
      case Routes.persons:
        ArgsPersonsPage args = settings.arguments as ArgsPersonsPage;
        return MaterialPageRoute(
          builder: (context) => PersonsPage(
            appBarName: args.appBarName,
            description: args.description,
          ),
        );
      case Routes.personaDetail:
        return MaterialPageRoute(builder: (context) => const AddPersonaDetailPage());
      case Routes.notImplemented:
        return MaterialPageRoute(builder: (context) => const NotImplementedPage());
      case Routes.updateReady:
        return MaterialPageRoute(builder: (context) => const UpdateReadyPage());
      default:
        return MaterialPageRoute(builder: (context) => const SplashPage());
    }
  }
}
