import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/resources/languages.dart';

class LanguageService {
  Future<LocalizationDelegate> initDelegate() async {
    return await LocalizationDelegate.create(
      fallbackLocale: LanguageCode.byDefault,
      supportedLocales: [
        LanguageCode.catalan,
        LanguageCode.spanish,
        LanguageCode.english,
      ],
      basePath: 'locale/i18n',
    );
  }

  List<Locale> getSupportedLocales(BuildContext context) {
    var delegate = LocalizedApp.of(context).delegate;
    return delegate.supportedLocales;
  }

  LocalizationDelegate getDelegate(BuildContext context) {
    var delegate = LocalizedApp.of(context).delegate;
    return delegate;
  }

  String getCurrentLanguageCode(BuildContext context) {
    var delegate = LocalizedApp.of(context).delegate;
    return delegate.currentLocale.languageCode;
  }

  Locale getCurrentLocale(BuildContext context) {
    var delegate = LocalizedApp.of(context).delegate;
    return delegate.currentLocale;
  }

  String get defaultLocaleCode => LanguageCode.byDefault;

  Future<void> changeCurrentLocale(BuildContext context, String languageCode) async {
    var delegate = LocalizedApp.of(context).delegate;
    await delegate.changeLocale(Locale(languageCode, ''));
  }
}
