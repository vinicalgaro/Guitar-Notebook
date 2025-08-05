import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  static const String _themeKey = 'theme_mode';
  static const String _languageKey = 'language_code';

  final SharedPreferences _prefs;

  SettingsRepository._(this._prefs);

  static Future<SettingsRepository> init() async {
    final prefs = await SharedPreferences.getInstance();
    return SettingsRepository._(prefs);
  }

  Future<void> saveThemePreference(ThemeMode theme) async {
    await _prefs.setString(_themeKey, theme.name);
  }

  Future<ThemeMode> getThemePreference() async {
    final themeName = _prefs.getString(_themeKey) ?? ThemeMode.system.name;

    try {
      return ThemeMode.values.firstWhere((e) => e.name == themeName);
    } catch (e) {
      return ThemeMode.system;
    }
  }

  Future<void> saveLanguagePreference(String languageCode) async {
    await _prefs.setString(_languageKey, languageCode);
  }

  Future<String> getLanguagePreference() async {
    return _prefs.getString(_languageKey) ?? 'pt';
  }
}
