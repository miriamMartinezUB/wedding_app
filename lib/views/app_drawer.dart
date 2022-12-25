import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/infrastructure/navigation/bloc/navigation_bloc.dart';
import 'package:wedding_jc/infrastructure/navigation/bloc/navigation_event.dart';
import 'package:wedding_jc/infrastructure/navigation/navigation_modal.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/resources/routes.dart';
import 'package:wedding_jc/views/text.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: PaletteColors.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: Dimens.paddingXLarge),
                child: Column(
                  children: const [
                    DrawerItem(
                      text: 'home',
                      iconData: Icons.home,
                      destination: Routes.home,
                    ),
                    DrawerItem(
                      text: 'information',
                      iconData: Icons.info,
                      destination: Routes.information,
                    ),
                    DrawerItem(
                      text: 'sign_out',
                      iconData: Icons.exit_to_app_outlined,
                      destination: Routes.information,
                      color: PaletteColors.textError,
                    ),
                    DrawerItem(
                      text: 'delete_account',
                      iconData: Icons.delete,
                      destination: Routes.information,
                      color: PaletteColors.textError,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimens.paddingXLarge),
              child: SizedBox(
                height: Dimens.iconSizeMedium,
                child: Center(
                  child: Image.asset('assets/images/logo.jpeg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String text;
  final IconData iconData;
  final String? destination;
  final Function? onTap;
  final Color? color;

  const DrawerItem({
    Key? key,
    required this.text,
    required this.iconData,
    this.destination,
    this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: PaletteColors.primary,
      onTap: () {
        if (destination != null) {
          final NavigatorBloc navigatorBloc = BlocProvider.of<NavigatorBloc>(context);
          if (destination == Routes.home) {
            navigatorBloc.add(HomeNavigationEvent());
          } else {
            navigatorBloc.add(
              PushScreenNavigationEvent(
                model: NavigationModel(route: destination!),
              ),
            );
          }
        }
        onTap?.call();
      },
      child: Column(
        children: [
          ListTile(
            title: AppText(
              translate(text),
              type: TextTypes.title,
              color: color,
            ),
            leading: Icon(
              iconData,
              color: color,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}