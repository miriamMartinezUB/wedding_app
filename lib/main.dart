import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_jc/infraestructure/locator_setup.dart';
import 'package:wedding_jc/infraestructure/navigation/navigation_bloc.dart';
import 'package:wedding_jc/infraestructure/navigation/navigator_service.dart';
import 'package:wedding_jc/infraestructure/navigation/router.dart';
import 'package:wedding_jc/resources/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  // final delegate =
  //     await LocalizationDelegate.create(fallbackLocale: 'ca', supportedLocales: ['ca'], basePath: 'locale');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) {
    runApp(MyApp());
    // runApp(LocalizedApp(delegate, MyApp()));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigatorBloc>(
          create: (context) => NavigatorBloc(0),
        ),
      ],
      child: MaterialApp(
        title: 'Wedding Judit and Cristian',
        // localizationsDelegates: [
        //   LocalizedApp.of(context).delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        initialRoute: Routes.splash,
        onGenerateRoute: WeddingRouter.generateRoute,
        navigatorKey: locator<NavigationService>().navigatorKey,
      ),
    );
  }
}
