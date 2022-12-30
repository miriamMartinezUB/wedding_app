part of 'language_bloc.dart';

abstract class LanguageState {}

class InitLanguageState extends LanguageState {}

class LoadingLanguageState extends LanguageState {}

class CurrentLanguageState extends LanguageState {
  final String currentLanguageCode;
  final List<String> supportedLanguageCodes;

  CurrentLanguageState({
    required this.currentLanguageCode,
    required this.supportedLanguageCodes,
  });
}
