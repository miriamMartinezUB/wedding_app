import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_jc/infrastructure/navigation/bloc/navigation_bloc.dart';
import 'package:wedding_jc/infrastructure/navigation/bloc/navigation_event.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/views/app_drawer.dart';
import 'package:wedding_jc/views/buttons/home_button.dart';
import 'package:wedding_jc/views/text.dart';

class PageWrapper extends StatelessWidget {
  final String appBarName;
  final Widget body;
  final bool showDrawer;
  final bool showBackButton;
  final bool canGoBack;
  final bool canGoHome;
  final Function? onPop;

  PageWrapper({
    Key? key,
    required this.appBarName,
    required this.body,
    this.showDrawer = false,
    this.showBackButton = false,
    this.canGoBack = true,
    this.canGoHome = true,
    this.onPop,
  }) : super(key: key) {
    assert(showBackButton != showDrawer);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (onPop != null) {
          onPop!();
        }
        return canGoBack;
      },
      child: Scaffold(
        drawer: showDrawer ? const AppDrawer() : null,
        appBar: AppBar(
          backgroundColor: PaletteColors.primary,
          centerTitle: true,
          iconTheme: const IconThemeData(color: PaletteColors.icons),
          leading: showBackButton
              ? InkWell(
                  child: const Icon(Icons.arrow_back_ios, color: PaletteColors.icons),
                  onTap: () {
                    if (onPop != null) {
                      onPop!();
                    }
                    BlocProvider.of<NavigatorBloc>(context).add(BackNavigationEvent());
                  },
                )
              : null,
          actions: canGoHome ? [const HomeButton()] : null,
          title: AppText(
            appBarName,
            type: TextTypes.titleMedium,
            align: TextAlign.center,
          ),
        ),
        body: body,
      ),
    );
  }
}
