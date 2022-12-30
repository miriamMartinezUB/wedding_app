import 'package:flutter/material.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/views/buttons/app_text_button.dart';
import 'package:wedding_jc/views/text.dart';

class ShowMyDialog {
  final String? title;
  final String text;
  final List<ContentAction>? actions;

  static const Color _colorActions = PaletteColors.text;

  ShowMyDialog({
    required this.title,
    required this.text,
    this.actions,
  });

  Future<void> show(BuildContext context) async {
    late List<Widget> customActions;
    if (actions != null) {
      customActions = _getActions(actions!, _colorActions);
    }

    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title == null
              ? null
              : AppText(
                  title!,
                  type: TextTypes.smallBodyMedium,
                ),
          content: AppText(
            text,
            type: TextTypes.smallBody,
          ),
          actions: customActions,
        );
      },
    );
  }

  List<Widget> _getActions(List<ContentAction> actions, Color colorActions) {
    List<Widget> result = [];
    for (ContentAction contentAction in actions) {
      result.add(
        AppTextButton(
          text: contentAction.textAction,
          onTap: contentAction.onPress,
          color: contentAction.color ?? _colorActions,
        ),
      );
    }
    return result;
  }
}

class ContentAction {
  final String textAction;
  final Color? color;
  final Function() onPress;

  ContentAction({required this.textAction, required this.onPress, this.color});
}
