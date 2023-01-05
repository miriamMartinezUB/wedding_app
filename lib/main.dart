import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/features/main_flow/bloc/main_flow_bloc.dart';
import 'package:wedding_jc/features/sign_up/bloc/sign_up_bloc.dart';
import 'package:wedding_jc/infrastructure/language/language_service.dart';
import 'package:wedding_jc/infrastructure/locator_setup.dart';
import 'package:wedding_jc/infrastructure/navigation/bloc/navigation_bloc.dart';
import 'package:wedding_jc/infrastructure/navigation/navigator_service.dart';
import 'package:wedding_jc/infrastructure/navigation/router.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/resources/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  await initializeConfigurationServices();

  final delegate = locator<LanguageService>().delegate;

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) {
    runApp(LocalizedApp(delegate, const MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LanguageService languageService = locator<LanguageService>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigatorBloc>(
          create: (context) => NavigatorBloc(0),
        ),
        BlocProvider<SignUpBloc>(
          create: (context) => SignUpBloc(),
        ),
        BlocProvider<MainFlowBloc>(
          create: (context) => MainFlowBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Wedding Judit and Cristian',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          languageService.delegate,
        ],
        supportedLocales: languageService.supportedLocales,
        locale: languageService.currentLocale,
        theme: ThemeData(
          backgroundColor: PaletteColors.background,
          primaryColor: PaletteColors.primary,
          shadowColor: PaletteColors.primary,
        ),
        initialRoute: Routes.splash,
        onGenerateRoute: WeddingRouter.generateRoute,
        navigatorKey: locator<NavigationService>().navigatorKey,
      ),
    );
  }
}
