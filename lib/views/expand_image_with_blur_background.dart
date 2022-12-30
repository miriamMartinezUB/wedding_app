import 'dart:ui';

import 'package:flutter/material.dart';

class ExpandImageWithBlurBackground extends StatelessWidget {
  final double height;
  final String imagePath;

  const ExpandImageWithBlurBackground({
    Key? key,
    required this.height,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(imagePath, fit: BoxFit.cover),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.grey.withOpacity(0.1),
                alignment: Alignment.center,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
