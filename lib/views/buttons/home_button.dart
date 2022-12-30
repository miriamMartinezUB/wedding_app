import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_jc/infrastructure/navigation/bloc/navigation_bloc.dart';
import 'package:wedding_jc/infrastructure/navigation/bloc/navigation_event.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/resources/palette_colors.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimens.paddingLarge),
        child: Icon(Icons.home, color: PaletteColors.icons),
      ),
      onTap: () {
        BlocProvider.of<NavigatorBloc>(context).add(HomeNavigationEvent());
      },
    );
  }
}
