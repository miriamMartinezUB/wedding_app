import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/views/text.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final bool shouldTranslate;
  final Color? color;
  final GestureTapCallback? onTap;

  const AppTextButton({
    Key? key,
    required this.text,
    this.shouldTranslate = true,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(
          PaletteColors.secondary.withOpacity(0.5),
        ),
      ),
      onPressed: onTap,
      child: AppText(
        shouldTranslate ? translate(text) : text,
        type: TextTypes.body,
        color: color,
        align: TextAlign.center,
      ),
    );
  }
}
