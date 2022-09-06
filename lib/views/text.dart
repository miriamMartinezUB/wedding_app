import 'package:flutter/material.dart';
import 'package:flutter_stylized_text/flutter_stylized_text.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/resources/palette_colors.dart';

enum TextTypes { title, titleBold, subtitle, body, bodyBold, smallBody, tiny }

class AppText extends StatelessWidget {
  final String text;
  final TextTypes type;
  final Color? color;
  final TextAlign align;

  const AppText(this.text, {Key? key, this.type = TextTypes.body, this.color, this.align = TextAlign.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterStylizedText(
      text: text,
      fontSize: getFontSize(type: type),
      fontWeight: getFontWeight(type: type),
      textAlign: align,
      stylizedTextColor: PaletteColors.primary,
      color: color ?? PaletteColors.text,
    );
  }
}

double getFontSize({TextTypes type = TextTypes.body}) {
  if (type.toString().toLowerCase().contains('title')) {
    return Dimens.textSizeTitle;
  } else if (type.toString().toLowerCase().contains('subtitle')) {
    return Dimens.textSizeSubtitle;
  } else if (type.toString().toLowerCase().contains('small')) {
    return Dimens.textSizeBodySmall;
  } else if (type.toString().toLowerCase().contains('tiny')) {
    return Dimens.textSizeBodyTiny;
  } else {
    return Dimens.textSizeBody;
  }
}

FontWeight getFontWeight({TextTypes type = TextTypes.body}) {
  if (type.toString().toLowerCase().contains('light')) {
    return Dimens.fontWeightLight;
  } else if (type.toString().toLowerCase().contains('medium')) {
    return Dimens.fontWeightMedium;
  } else if (type.toString().toLowerCase().contains('bold')) {
    return Dimens.fontWeightBold;
  } else {
    return Dimens.fontWeightRegular;
  }
}
