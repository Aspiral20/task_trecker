import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

AppLocalizations? getTranslatedLang(context) {
  final localizations = AppLocalizations.of(context);
  return localizations;
}

enum LanguagesEnum { en, ro, ru }

final List<Map> fullLocales = [
  {
    'nameLang': 'English',
    'langKey': 'en',
    'langRadioKey': LanguagesEnum.en,
    'locale': const Locale('en', '')
  },
  {
    'nameLang': 'Romanian',
    'langKey': 'ro',
    'langRadioKey': LanguagesEnum.ro,
    'locale': const Locale('ro', '')
  },
  {
    'nameLang': 'Russian',
    'langKey': 'ru',
    'langRadioKey': LanguagesEnum.ru,
    'locale': const Locale('ru', '')
  },
];

final localeLangs = [
  const Locale('en', ''),
  const Locale('ro', ''),
  const Locale('ru', ''),
];
