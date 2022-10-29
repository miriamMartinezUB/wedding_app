import 'package:flutter/material.dart';
import 'package:wedding_jc/resources/palette_colors.dart';

class Spinner extends StatelessWidget {
  const Spinner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: PaletteColors.primary,
        backgroundColor: PaletteColors.shadow,
      ),
    );
  }
}
