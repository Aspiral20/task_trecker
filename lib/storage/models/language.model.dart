import 'package:flutter/material.dart';
import 'package:task_trecker/l10n/l10n.dart';

class LanguageModel with ChangeNotifier {
  Locale _locale = localeLangs[0];

  Locale get locale => _locale;

  void setLocale(Locale newLocale) {
    _locale = newLocale;
    notifyListeners();
  }
}