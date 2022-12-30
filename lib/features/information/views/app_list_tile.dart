import 'package:flutter/material.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/views/text.dart';

class AppListTile extends StatelessWidget {
  final String text;
  final IconData? iconData;
  final Function()? onTap;
  final bool isTitle;

  const AppListTile({
    Key? key,
    required this.text,
    this.iconData,
    this.onTap,
    this.isTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: AppText(
        text,
        type: isTitle ? TextTypes.bodyMedium : TextTypes.tinyBody,
      ),
      leading: iconData == null
          ? null
          : Icon(
              iconData,
              color: PaletteColors.icons,
            ),
    );
  }
}
