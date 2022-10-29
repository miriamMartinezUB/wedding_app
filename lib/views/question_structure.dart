import 'package:flutter/material.dart';
import 'package:wedding_jc/domain/form.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/views/text.dart';

class QuestionStructure extends StatelessWidget {
  final Question question;

  const QuestionStructure({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? questionType = _questionType;
    if (question.visibility) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: Dimens.paddingLarge,
          ),
          AppText(
            question.title,
          ),
          const SizedBox(
            height: Dimens.paddingLarge,
          ),
          if (question.subtitle != null)
            AppText(
              question.subtitle!,
              type: TextTypes.subtitle,
            ),
          if (questionType != null) ...[
            const SizedBox(
              height: Dimens.paddingLarge,
            ),
            questionType,
          ],
        ],
      );
    }
    return Container();
  }

  Widget? get _questionType {
    if (Question is DateQuestion) {
      return Container();
    }
    if (Question is SingleSelectionQuestion) {
      return Container();
    }
    if (Question is FreeTextQuestion) {
      return Container();
    }
    return null;
  }
}
