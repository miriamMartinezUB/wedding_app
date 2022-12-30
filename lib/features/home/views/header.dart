import 'package:flutter/material.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/views/count_down.dart';
import 'package:wedding_jc/views/expand_image_with_blur_background.dart';
import 'package:wedding_jc/views/text.dart';

const double _height = 300;

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
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(
          Dimens.radiusLarge,
        ),
      ),
      child: Stack(
        children: [
          const ExpandImageWithBlurBackground(height: _height, imagePath: 'assets/images/judit_and_cristian.jpeg'),
          SizedBox(
            height: _height,
            child: Center(
              child: Container(
                width: double.infinity,
                color: PaletteColors.primary.withOpacity(0.7),
                padding: const EdgeInsets.symmetric(
                  vertical: Dimens.paddingXLarge,
                  horizontal: Dimens.paddingLarge,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText(
                      title,
                      type: TextTypes.titleMedium,
                      align: TextAlign.center,
                      // color: PaletteColors.textSubtitle,
                    ),
                    const SizedBox(
                      height: Dimens.paddingLarge,
                    ),
                    AppText(
                      subtitle,
                      type: TextTypes.body,
                      align: TextAlign.center,
                      // color: PaletteColors.textSubtitle,
                    ),
                    const SizedBox(
                      height: Dimens.paddingMedium,
                    ),
                    CountDown.wedding(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    return Container(
      decoration: const BoxDecoration(
        color: PaletteColors.secondary,
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
              // color: PaletteColors.textSubtitle,
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
