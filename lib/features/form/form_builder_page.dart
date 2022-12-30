import 'package:flutter/material.dart';
import 'package:wedding_jc/domain/form.dart';
import 'package:wedding_jc/domain/question/question.dart';
import 'package:wedding_jc/features/form/views/question_structure.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/views/page_wrapper.dart';

class ArgsFormBuilderPage {
  final AppForm form;

  ArgsFormBuilderPage({required this.form});
}

class FormBuilderPage extends StatelessWidget {
  final AppForm form;
  const FormBuilderPage({Key? key, required this.form}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      appBarName: form.name,
      canGoHome: true,
      body: _FormBuilder(
        questions: form.questions == null ? form.questionsByPerson! : form.questions!,
      ),
    );
  }
}

class _FormBuilder extends StatelessWidget {
  final List<Question> questions;
  const _FormBuilder({Key? key, required this.questions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.symmetric(vertical: Dimens.paddingXLarge, horizontal: Dimens.paddingLarge),
      itemCount: questions.length,
      itemBuilder: (context, index) {
        return QuestionStructure(question: questions[index]);
      },
    );
  }
}
