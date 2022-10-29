import 'package:flutter/material.dart';
import 'package:wedding_jc/resources/palette_colors.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      backgroundColor: Colors.black12,
      valueColor: AlwaysStoppedAnimation<Color>(PaletteColors.primary),
    ));
  }
}
