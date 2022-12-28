import 'package:flutter/material.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/views/text.dart';

class AppOutlinedButton extends StatelessWidget {
  final String text;
  final bool shouldTranslate;
  final GestureTapCallback? onTap;

  const AppOutlinedButton({
    Key? key,
    required this.text,
    this.shouldTranslate = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(PaletteColors.background),
          foregroundColor: MaterialStateProperty.all(PaletteColors.primary),
          side: MaterialStateProperty.all(
            const BorderSide(color: PaletteColors.primary),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.radiusMedium),
            ),
          ),
        ),
        onPressed: () {},
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(Dimens.paddingLarge),
            child: AppText(
              text,
              type: TextTypes.body,
              align: TextAlign.center,
            ),
          ),
        ));
  }
}
