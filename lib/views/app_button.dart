import 'package:flutter/material.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/views/text.dart';

class AppButton extends StatelessWidget {
  final String text;
  final bool shouldTranslate;
  final GestureTapCallback? onTap;

  const AppButton({
    Key? key,
    required this.text,
    this.shouldTranslate = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: PaletteColors.primary,
          borderRadius: BorderRadius.circular(Dimens.radiusMedium),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Dimens.paddingLarge),
          child: AppText(
            text,
            type: TextTypes.body,
            align: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
