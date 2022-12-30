part of 'language_bloc.dart';

abstract class LanguageEvent {}

class LanguageInitEvent extends LanguageEvent {}

class ChangeLanguageEvent extends LanguageEvent {
  final String newLanguageCode;

  ChangeLanguageEvent(this.newLanguageCode);
}
