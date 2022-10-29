import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/views/text.dart';

class ShowMyDialog {
  final String? title;
  final String text;
  final List<ContentAction>? actions;

  static const Color _colorActions = PaletteColors.primary;
  static const TextAlign _textAlignActions = TextAlign.end;

  ShowMyDialog({
    required this.title,
    required this.text,
    this.actions,
  });

  show(BuildContext context) async {
    late List<Widget> customActions;
    if (actions != null) {
      customActions = getActions(actions!, _colorActions, _textAlignActions);
    }

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title == null
              ? null
              : AppText(
                  title!,
                  type: TextTypes.smallBodyMedium,
                ),
          content: SingleChildScrollView(
            child: AppText(
              text,
              type: TextTypes.smallBody,
            ),
          ),
          actions: actions == null
              ? <Widget>[
                  TextButton(
                    child: AppText(
                      translate('accept'),
                      type: TextTypes.bodyMedium,
                      align: _textAlignActions,
                      color: _colorActions,
                    ),
                    onPressed: () {
                      // NavigationManager(context).back();
                    },
                  ),
                ]
              : customActions,
        );
      },
    );
  }

  List<Widget> getActions(List<ContentAction> actions, Color colorActions, textAlignActions) {
    List<Widget> result = [];
    for (ContentAction contentAction in actions) {
      result.add(
        TextButton(
          onPressed: contentAction.onPress,
          child: AppText(
            contentAction.textAction,
            type: TextTypes.bodyMedium,
            align: _textAlignActions,
            color: _colorActions,
          ),
        ),
      );
    }
    return result;
  }
}

class ContentAction {
  final String textAction;
  final Function() onPress;

  ContentAction({required this.textAction, required this.onPress});
}
