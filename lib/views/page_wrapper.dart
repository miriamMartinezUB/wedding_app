import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_jc/infrastructure/navigation/bloc/navigation_bloc.dart';
import 'package:wedding_jc/infrastructure/navigation/bloc/navigation_event.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/views/buttons/home_button.dart';
import 'package:wedding_jc/views/text.dart';

class PageWrapper extends StatelessWidget {
  final String appBarName;
  final Widget body;
  final bool showBackButton;
  final bool showHomeButton;
  final bool canGoBack;
  final bool canGoHome;
  final Function? onPop;

  const PageWrapper({
    Key? key,
    required this.appBarName,
    required this.body,
    this.showBackButton = true,
    this.showHomeButton = false,
    this.canGoBack = true,
    this.canGoHome = false,
    this.onPop,
  }) : super(key: key);

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
        appBar: AppBar(
          backgroundColor: PaletteColors.primary,
          centerTitle: true,
          leading: InkWell(
            child: const Icon(Icons.arrow_back_ios, color: PaletteColors.text),
            onTap: () {
              if (onPop != null) {
                onPop!();
              }
              BlocProvider.of<NavigatorBloc>(context).add(BackNavigationEvent());
            },
          ),
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
