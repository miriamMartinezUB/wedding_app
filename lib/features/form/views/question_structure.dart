import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/domain/question/index.dart';
import 'package:wedding_jc/features/form/views/question_checkbox..dart';
import 'package:wedding_jc/features/form/views/question_date.dart';
import 'package:wedding_jc/features/form/views/question_free_text.dart';
import 'package:wedding_jc/features/form/views/question_single_select.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/views/text.dart';

class QuestionStructure extends StatelessWidget {
  final Question question;
  final Function(String value) onChange;

  const QuestionStructure({super.key, required this.question, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: Key(question.id),
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Flexible(child: AppText(translate(question.title))),
            if (question.mandatory) ...[
              const SizedBox(width: Dimens.paddingLarge),
              const AppText(
                '*',
                color: PaletteColors.textError,
              ),
            ],
          ],
        ),
        if (question.subtitle != null) ...[
          const SizedBox(width: Dimens.paddingLarge),
          AppText(
            translate(question.subtitle!),
            color: PaletteColors.textSubtitle,
          ),
        ],
        const SizedBox(height: Dimens.paddingLarge),
        if (question is FreeTextQuestion)
          QuestionFreeText(
            isLong: (question as FreeTextQuestion).longText,
            onChanged: onChange,
          ),
        if (question is SingleSelectionQuestion)
          QuestionSingleSelect(
            values: (question as SingleSelectionQuestion).values,
            initialValue: (question as SingleSelectionQuestion).initialSelectedValue,
            onChange: onChange,
          ),
        if (question is CheckBoxQuestion)
          QuestionCheckBox(
            values: (question as CheckBoxQuestion).values!,
            valuesSelected: (question as CheckBoxQuestion).initialSelectedValues ?? [],
            onChange: onChange,
          ),
        if (question is DateQuestion)
          QuestionDate(
            initialDate: (question as DateQuestion).date,
            onChange: onChange,
          ),
      ],
    );
  }
}
