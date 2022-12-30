import 'package:flutter/material.dart';
import 'package:flutter_stylized_text/flutter_stylized_text.dart';
import 'package:selectable_autolink_text/selectable_autolink_text.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/resources/palette_colors.dart';

enum TextTypes {
  title,
  titleMedium,
  titleBold,
  subtitle,
  body,
  bodyMedium,
  bodyBold,
  smallLink,
  smallBody,
  smallBodyLight,
  smallBodyMedium,
  tinyBody,
}

abstract class TextMother extends StatelessWidget {
  final String text;
  final Color? color;
  final TextTypes type;
  final TextAlign align;

  const TextMother(
    this.text, {
    required this.type,
    required this.align,
    this.color,
    Key? key,
  }) : super(key: key);
}

class AppText extends TextMother {
  const AppText(
    String text, {
    TextTypes type = TextTypes.body,
    TextAlign align = TextAlign.start,
    Color? color,
    Key? key,
  }) : super(
          text,
          type: type,
          align: align,
          color: color,
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return FlutterStylizedText(
      text: text,
      fontSize: _getFontSize(type: type),
      fontWeight: _getFontWeight(type: type),
      textAlign: align,
      stylizedTextColor: PaletteColors.primary,
      color: color ?? _getColor(type: type),
    );
  }
}

class TextAutoLink extends TextMother {
  const TextAutoLink(
    String text, {
    TextTypes type = TextTypes.smallLink,
    TextAlign align = TextAlign.start,
    Color? color,
    Key? key,
  }) : super(
          text,
          type: type,
          align: align,
          color: color,
          key: key,
        );

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw (FlutterError('Invalid url'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SelectableAutoLinkText(
      text,
      style: getTextStyle(type: type, color: color),
      linkStyle: getTextStyle(type: type, color: color),
      onTransformDisplayLink: AutoLinkUtils.shrinkUrl,
      onTap: (url) async {
        await _launchURL(url);
      },
    );
  }
}

TextStyle getTextStyle({
  TextTypes type = TextTypes.body,
  Color? color,
}) {
  return TextStyle(
    color: color ?? _getColor(type: type),
    fontWeight: _getFontWeight(type: type),
    fontSize: _getFontSize(type: type),
  );
}

Color _getColor({TextTypes type = TextTypes.body}) {
  if (type.name.toLowerCase().contains('subtitle')) {
    return PaletteColors.textSubtitle;
  } else if (type.name.toLowerCase().contains('link')) {
    return PaletteColors.textLink;
  } else {
    return PaletteColors.text;
  }
}

double _getFontSize({TextTypes type = TextTypes.body}) {
  if (type.name.toLowerCase().contains('subtitle')) {
    return Dimens.textSizeSubtitle;
  } else if (type.name.toLowerCase().contains('title')) {
    return Dimens.textSizeTitle;
  } else if (type.name.toLowerCase().contains('small')) {
    return Dimens.textSizeBodySmall;
  } else if (type.name.toLowerCase().contains('tiny')) {
    return Dimens.textSizeBodyTiny;
  } else {
    return Dimens.textSizeBody;
  }
}

FontWeight _getFontWeight({TextTypes type = TextTypes.body}) {
  if (type.name.toLowerCase().contains('light')) {
    return Dimens.fontWeightLight;
  } else if (type.name.toLowerCase().contains('medium')) {
    return Dimens.fontWeightMedium;
  } else if (type.name.toLowerCase().contains('bold')) {
    return Dimens.fontWeightBold;
  } else {
    return Dimens.fontWeightRegular;
  }
}
