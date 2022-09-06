import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_jc/infraestructure/navigation/navigation_bloc.dart';
import 'package:wedding_jc/infraestructure/navigation/navigation_event.dart';
import 'package:wedding_jc/infraestructure/navigation/navigation_modal.dart';
import 'package:wedding_jc/resources/routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          child: const Icon(Icons.abc, size: 100),
          onTap: () {
            BlocProvider.of<NavigatorBloc>(context).add(
              PushScreenNavigationEvent(
                model: NavigationModel(route: Routes.home),
              ),
            );
          },
        ),
      ),
    );
  }
}
