import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/utils/date_time_utils.dart';
import 'package:wedding_jc/views/text.dart';

class QuestionDate extends StatelessWidget {
  final String? initialDate;
  final Function(String newDate) onChange;
  const QuestionDate({Key? key, required this.onChange, this.initialDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.radiusSmall),
        border: Border.all(color: Colors.grey),
      ),
      child: InkWell(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        onTap: () => Picker(
            hideHeader: true,
            adapter: DateTimePickerAdapter(),
            title: AppText(translate('add_person_question_date_birth')),
            cancelText: translate('common_confirm'),
            confirmText: translate('common_cancel'),
            confirmTextStyle: getTextStyle(type: TextTypes.title, color: PaletteColors.primary),
            cancelTextStyle: getTextStyle(type: TextTypes.title, color: PaletteColors.primary),
            selectedTextStyle: getTextStyle(),
            textStyle: getTextStyle(type: TextTypes.subtitle),
            onConfirm: (Picker picker, List value) {
              String newDate = (picker.adapter as DateTimePickerAdapter).value!.formatDate;
              onChange(newDate);
            }).showDialog(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.paddingMedium, vertical: Dimens.paddingLarge),
          child: AppText(
            initialDate ?? 'MM/DD/YYYY',
            type: TextTypes.subtitle,
          ),
        ),
      ),
    );
  }
}
