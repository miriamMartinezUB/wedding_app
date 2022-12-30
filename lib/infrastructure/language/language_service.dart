import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/resources/languages.dart';

class LanguageService {
  late LocalizationDelegate _delegate;

  Future<LocalizationDelegate> initDelegate() async {
    _delegate = await LocalizationDelegate.create(
      fallbackLocale: LanguageCode.byDefault,
      supportedLocales: [
        LanguageCode.catalan,
        LanguageCode.spanish,
        LanguageCode.english,
      ],
      basePath: 'locale/i18n',
    );
    return _delegate;
  }

  List<Locale> get supportedLocales {
    return _delegate.supportedLocales;
  }

  LocalizationDelegate get delegate {
    return _delegate;
  }

  String get currentLanguageCode {
    return _delegate.currentLocale.languageCode;
  }

  Locale get currentLocale {
    return _delegate.currentLocale;
  }

  String get defaultLocaleCode => LanguageCode.byDefault;

  Future<void> changeCurrentLocale(String languageCode) async {
    await _delegate.changeLocale(Locale(languageCode, ''));
  }
}
