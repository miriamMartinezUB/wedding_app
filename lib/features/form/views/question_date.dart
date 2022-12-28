import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/views/text.dart';

class QuestionDate extends StatelessWidget {
  const QuestionDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Picker(
          hideHeader: true,
          adapter: DateTimePickerAdapter(),
          title: Text("Select Data"),
          cancelText: translate('common_confirm'),
          confirmText: translate('common_cancel'),
          confirmTextStyle: getTextStyle(type: TextTypes.title, color: PaletteColors.primary),
          cancelTextStyle: getTextStyle(type: TextTypes.title, color: PaletteColors.primary),
          selectedTextStyle: getTextStyle(),
          textStyle: getTextStyle(type: TextTypes.subtitle),
          onConfirm: (Picker picker, List value) {
            print((picker.adapter as DateTimePickerAdapter).value);
          }).showDialog(context),
      child: AppText('text'),
    );
  }
}
