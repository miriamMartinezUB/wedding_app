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

  const QuestionStructure({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.paddingLarge),
      child: Column(
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
          if (question is FreeTextQuestion) const QuestionFreeText(),
          if (question is SingleSelectionQuestion) const QuestionSingleSelect(),
          if (question is CheckBoxQuestion) const QuestionCheckBox(),
          if (question is DateQuestion) const QuestionDate(),
        ],
      ),
    );
  }
}
