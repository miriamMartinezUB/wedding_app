import 'package:flutter/material.dart';
import 'package:wedding_jc/features/information/views/app_list_tile.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/views/expand_image_with_blur_background.dart';

class CardWithImageAndDescription extends StatelessWidget {
  final String? imagePath;
  final List<AppListTile> descriptions;

  const CardWithImageAndDescription({
    Key? key,
    required this.descriptions,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.radiusMedium),
        ),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imagePath != null)
              ExpandImageWithBlurBackground(
                height: 200,
                imagePath: imagePath!,
              ),
            ...descriptions.map((description) => description),
            const SizedBox(height: Dimens.paddingLarge)
          ],
        ),
      ),
    );
  }
}
