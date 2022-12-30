import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_jc/infrastructure/language/language_service.dart';
import 'package:wedding_jc/infrastructure/locator_setup.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final LanguageService _languageService = locator<LanguageService>();
  LanguageBloc() : super(InitLanguageState()) {
    on<LanguageInitEvent>((event, emit) {
      emit(CurrentLanguageState(
        currentLanguageCode: _languageService.currentLanguageCode,
        supportedLanguageCodes: _languageService.languageCodes,
      ));
    });
    on<ChangeLanguageEvent>((event, emit) async {
      emit(LoadingLanguageState());
      await _languageService.changeCurrentLocale(event.newLanguageCode);
      emit(CurrentLanguageState(
        currentLanguageCode: event.newLanguageCode,
        supportedLanguageCodes: _languageService.languageCodes,
      ));
    });
  }
}
