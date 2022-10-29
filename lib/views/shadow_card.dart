import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/views/text.dart';

BorderRadius _borderRadiusCardButton = BorderRadius.circular(Dimens.radiusMedium);

class CardButton extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final Icon? leading;
  final Icon? trailing;

  const CardButton({
    Key? key,
    required this.title,
    this.subtitle,
    this.onTap,
    this.leading,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: _borderRadiusCardButton,
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 80),
        decoration: BoxDecoration(
          borderRadius: _borderRadiusCardButton,
          color: PaletteColors.card,
          boxShadow: const [
            BoxShadow(
              color: PaletteColors.shadow,
              blurRadius: 2.5,
              spreadRadius: 0.5,
              offset: Offset(2, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            if (leading != null) ...[
              const SizedBox(
                width: Dimens.paddingLarge,
              ),
              leading!
            ],
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Dimens.paddingLarge,
                    horizontal: leading == null && trailing == null ? Dimens.paddingLarge : Dimens.paddingMedium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      translate(title),
                      type: TextTypes.bodyMedium,
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: Dimens.paddingMedium),
                      AppText(
                        translate(subtitle!),
                        type: TextTypes.smallBody,
                      ),
                    ]
                  ],
                ),
              ),
            ),
            if (trailing != null) ...[
              trailing!,
              const SizedBox(
                width: Dimens.paddingLarge,
              )
            ]
          ],
        ),
      ),
    );
  }
}
