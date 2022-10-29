import 'package:flutter/material.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/views/count_down.dart';
import 'package:wedding_jc/views/text.dart';

class Header extends StatelessWidget {
  final String title;
  final String subtitle;

  const Header({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: PaletteColors.primary,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(
            Dimens.radiusLarge,
          ),
        ),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Dimens.paddingXLarge,
          horizontal: Dimens.paddingLarge,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              title,
              type: TextTypes.titleMedium,
              align: TextAlign.center,
            ),
            const SizedBox(
              height: Dimens.paddingMedium,
            ),
            AppText(
              subtitle,
              type: TextTypes.body,
              align: TextAlign.center,
            ),
            const SizedBox(
              height: Dimens.paddingLarge,
            ),
            CountDown.wedding(),
          ],
        ),
      ),
    );
  }
}
