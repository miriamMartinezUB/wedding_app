import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/features/change_language/bloc/language_bloc.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/views/buttons/app_text_button.dart';
import 'package:wedding_jc/views/circular_progress.dart';
import 'package:wedding_jc/views/page_wrapper.dart';
import 'package:wedding_jc/views/text.dart';

class ChangeLanguagePage extends StatelessWidget {
  const ChangeLanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LanguageBloc bloc = LanguageBloc();
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is InitLanguageState) {
            bloc.add(LanguageInitEvent());
          }
          if (state is CurrentLanguageState) {
            return PageWrapper(
              appBarName: translate('change_language'),
              showDrawer: true,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Dimens.paddingXLarge,
                    horizontal: Dimens.paddingLarge,
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: AppText(
                          translate('select_language'),
                          align: TextAlign.center,
                          type: TextTypes.titleBold,
                        ),
                      ),
                      const SizedBox(height: Dimens.paddingXLarge),
                      ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        padding: const EdgeInsets.all(Dimens.paddingLarge),
                        itemCount: state.supportedLanguageCodes.length,
                        itemBuilder: (context, index) {
                          String languageCode = state.supportedLanguageCodes[index];
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom: languageCode == state.supportedLanguageCodes.last ? 0 : Dimens.paddingLarge),
                            child: AppTextButton(
                              text: 'select_language_$languageCode',
                              color: state.currentLanguageCode == languageCode
                                  ? PaletteColors.primary
                                  : PaletteColors.textSubtitle,
                              onTap: () {
                                bloc.add(ChangeLanguageEvent(languageCode));
                              },
                            ),
                          );
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
