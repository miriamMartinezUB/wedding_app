import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/features/main_flow/bloc/main_flow_bloc.dart';
import 'package:wedding_jc/features/main_flow/drawer_item_id.dart';
import 'package:wedding_jc/infrastructure/auth/auth_service.dart';
import 'package:wedding_jc/infrastructure/locator_setup.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/views/text.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainFlowBloc bloc = BlocProvider.of<MainFlowBloc>(context);
    final AuthService authService = locator<AuthService>();
    return SafeArea(
      child: Drawer(
        backgroundColor: PaletteColors.background,
        child: BlocBuilder<MainFlowBloc, MainFlowState>(
          bloc: bloc,
          builder: (context, state) {
            return Column(
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
                          onTap: () => bloc.add(ChangeMainScreenEvent(itemId: DrawerItemId.home)),
                        ),
                        if (authService.isUserAdmin)
                          DrawerItem(
                            text: translate('summary'),
                            iconData: Icons.summarize_outlined,
                            onTap: () => bloc.add(ChangeMainScreenEvent(itemId: DrawerItemId.summary)),
                          ),
                        DrawerItem(
                          text: translate('information'),
                          iconData: Icons.info_outline_rounded,
                          onTap: () => bloc.add(ChangeMainScreenEvent(itemId: DrawerItemId.information)),
                        ),
                        DrawerItem(
                          text: translate('bank_account_title'),
                          iconData: Icons.card_giftcard,
                          onTap: () => bloc.add(ChangeMainScreenEvent(itemId: DrawerItemId.present)),
                        ),
                        DrawerItem(
                          text: translate('invitation'),
                          iconData: Icons.document_scanner_outlined,
                          onTap: () => bloc.add(ChangeMainScreenEvent(itemId: DrawerItemId.invitation)),
                        ),
                        DrawerItem(
                          text: translate('change_language'),
                          iconData: Icons.language_rounded,
                          onTap: () => bloc.add(ChangeMainScreenEvent(itemId: DrawerItemId.changeLanguage)),
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
            );
          },
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function() onTap;
  final Color? color;

  DrawerItem({
    Key? key,
    required this.text,
    required this.iconData,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: PaletteColors.primary,
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
