import 'package:flutter/material.dart';
import 'package:wedding_jc/features/change_language/change_language_page.dart';
import 'package:wedding_jc/features/errors/not_implemented_page.dart';
import 'package:wedding_jc/features/errors/update_ready_page.dart';
import 'package:wedding_jc/features/form/form_builder_page.dart';
import 'package:wedding_jc/features/home/home_page.dart';
import 'package:wedding_jc/features/information/information_page.dart';
import 'package:wedding_jc/features/persons/pages/persons_page.dart';
import 'package:wedding_jc/features/present/present_page.dart';
import 'package:wedding_jc/features/sign_up/sign_up_page.dart';
import 'package:wedding_jc/features/splash/splash_page.dart';
import 'package:wedding_jc/resources/routes.dart';

class WeddingRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signUp:
        return MaterialPageRoute(builder: (context) => const RegisterPage());
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case Routes.information:
        return MaterialPageRoute(builder: (context) => const InformationPage());
      case Routes.persons:
        return MaterialPageRoute(builder: (context) => const PersonsPage());
      case Routes.present:
        return MaterialPageRoute(builder: (context) => const PresentPage());
      case Routes.form:
        ArgsFormBuilderPage args = settings.arguments as ArgsFormBuilderPage;
        return MaterialPageRoute(
          builder: (context) => FormBuilderPage(
            formId: args.formId,
            personId: args.personId,
            addValues: args.addValues,
          ),
        );
      case Routes.notImplemented:
        return MaterialPageRoute(
            builder: (context) => const NotImplementedPage());
      case Routes.updateReady:
        return MaterialPageRoute(builder: (context) => const UpdateReadyPage());
      case Routes.changeLanguage:
        return MaterialPageRoute(
            builder: (context) => const ChangeLanguagePage());
      default:
        return MaterialPageRoute(builder: (context) => const SplashPage());
    }
  }
}
