import 'package:flutter/material.dart';
import 'package:wedding_jc/domain/form.dart';
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
      body: form.questions == null ? _FormBuilderWithQuestionsByPerson(form: form) : _FormBuilder(form: form),
    );
  }
}

class _FormBuilder extends StatelessWidget {
  final AppForm form;
  const _FormBuilder({Key? key, required this.form}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        padding: const EdgeInsets.symmetric(vertical: Dimens.paddingXLarge, horizontal: Dimens.paddingLarge),
        itemCount: form.questions!.length,
        itemBuilder: (context, index) {
          return QuestionStructure(question: form.questions![index]);
        });
  }
}

class _FormBuilderWithQuestionsByPerson extends StatelessWidget {
  final AppForm form;
  const _FormBuilderWithQuestionsByPerson({Key? key, required this.form}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
