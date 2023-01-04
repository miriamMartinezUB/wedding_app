import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/infrastructure/auth/auth_service.dart';
import 'package:wedding_jc/infrastructure/locator_setup.dart';
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
    final AuthService authService = locator<AuthService>();
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
                  children: [
                    DrawerItem(
                      text: translate('home'),
                      iconData: Icons.home_outlined,
                      destination: Routes.home,
                    ),
                    DrawerItem(
                      text: translate('information'),
                      iconData: Icons.info_outline_rounded,
                      destination: Routes.information,
                    ),
                    DrawerItem(
                      text: translate('bank_account_title'),
                      iconData: Icons.card_giftcard,
                      destination: Routes.present,
                    ),
                    DrawerItem(
                      text: translate('invitation'),
                      iconData: Icons.document_scanner_outlined,
                      destination: Routes.invitation,
                    ),
                    DrawerItem(
                      text: translate('change_language'),
                      iconData: Icons.language_rounded,
                      destination: Routes.changeLanguage,
                    ),
                    DrawerItem(
                      text: translate('sign_out'),
                      iconData: Icons.exit_to_app_outlined,
                      color: PaletteColors.textError,
                      onTap: () {
                        authService.logout();
                      },
                    ),
                    DrawerItem(
                      text: translate('delete_account'),
                      iconData: Icons.delete_outline_rounded,
                      color: PaletteColors.textError,
                      onTap: () {
                        authService.deleteAccount();
                      },
                    ),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: Dimens.paddingXLarge),
            //   child: SizedBox(
            //     height: Dimens.iconSizeMedium,
            //     child: Center(
            //       child: Image.asset('assets/images/logo.jpeg'),
            //     ),
            //   ),
            // ),
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

  DrawerItem({
    Key? key,
    required this.text,
    required this.iconData,
    this.destination,
    this.onTap,
    this.color,
  }) : super(key: key) {
    assert((destination != null && onTap == null) || (destination == null && onTap != null));
  }

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
              type: TextTypes.body,
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
