import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/domain/question/question.dart';
import 'package:wedding_jc/features/form/form/app_form_bloc.dart';
import 'package:wedding_jc/features/form/views/question_structure.dart';
import 'package:wedding_jc/infrastructure/navigation/bloc/navigation_bloc.dart';
import 'package:wedding_jc/infrastructure/navigation/bloc/navigation_event.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/views/buttons/app_button.dart';
import 'package:wedding_jc/views/circular_progress.dart';
import 'package:wedding_jc/views/page_wrapper.dart';
import 'package:wedding_jc/views/show_my_dialog.dart';

class ArgsFormBuilderPage {
  final String formId;
  final String? personId;
  final bool addValues;

  ArgsFormBuilderPage({
    required this.formId,
    this.personId,
    this.addValues = false,
  });
}

class FormBuilderPage extends StatelessWidget {
  final String formId;
  final String? personId;
  final bool addValues;

  const FormBuilderPage({
    Key? key,
    required this.formId,
    required this.addValues,
    this.personId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppFormBloc bloc = AppFormBloc(formId);
    final NavigatorBloc navigatorBloc = BlocProvider.of<NavigatorBloc>(context);
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<AppFormBloc, AppFormState>(
        builder: (context, state) {
          if (state is FormInitial) {
            bloc.add(LoadFormEvent(
              personId: personId,
              addValues: addValues,
            ));
          }
          if (state is FormLoaded) {
            return PageWrapper(
              appBarName: translate(state.form.name),
              showBackButton: true,
              canGoHome: false,
              canGoBack: false,
              onPop: () {
                ShowMyDialog(
                  title: translate('form_dialog_title'),
                  text: translate('form_dialog_text'),
                  actions: [
                    ContentAction(
                      textAction: translate('common_confirm'),
                      color: PaletteColors.textSubtitle,
                      onPress: () {
                        navigatorBloc.add(BackNavigationEvent());
                        navigatorBloc.add(BackNavigationEvent());
                      },
                    ),
                    ContentAction(
                      textAction: translate('common_cancel'),
                      onPress: () {
                        navigatorBloc.add(BackNavigationEvent());
                      },
                    ),
                  ],
                ).show(context);
              },
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: Dimens.paddingXLarge, horizontal: Dimens.paddingLarge),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: state.form.questions.length,
                        itemBuilder: (context, index) {
                          Question question = state.form.questions[index];
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom: question == state.form.questions.last ? 0 : Dimens.paddingLarge),
                            child: QuestionStructure(
                              question: question,
                              onChange: (String newValue, {bool? add}) {
                                bloc.add(EditQuestionFormEvent(questionId: question.id, value: newValue));
                              },
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: Dimens.paddingXLarge),
                      AppButton(
                        text: 'common_save',
                        shouldTranslate: true,
                        onTap: () {
                          bloc.add(SaveFormEvent());
                          navigatorBloc.add(HomeNavigationEvent());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const CircularProgress();
        },
      ),
    );
  }
}
