import 'package:flutter/material.dart';
import '../model/settings_repository.dart';

class LocaleViewModel extends ChangeNotifier {
  final SettingsRepository _settingsRepository;

  Locale _locale = const Locale('pt');

  LocaleViewModel(this._settingsRepository) {
    _loadLocale();
  }

  Locale get locale => _locale;

  void _loadLocale() async {
    final languageCode = await _settingsRepository.getLanguagePreference();
    _locale = Locale(languageCode);
    notifyListeners();
  }

  Future<void> setLocale(Locale newLocale) async {
    if (_locale == newLocale) return;

    _locale = newLocale;
    await _settingsRepository.saveLanguagePreference(newLocale.languageCode);
    notifyListeners();
  }
}