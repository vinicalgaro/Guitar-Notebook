import 'package:flutter/material.dart';

import '../model/settings_repository.dart';

class ThemeViewModel with ChangeNotifier {
  final SettingsRepository _repository;

  ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;

  ThemeViewModel(this._repository) : _themeMode = ThemeMode.system {
    _loadTheme();
  }

  void _loadTheme() async {
    _themeMode = await _repository.getThemePreference();
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) async {
    if (mode == _themeMode) return;
    _themeMode = mode;

    await _repository.saveThemePreference(mode);
    notifyListeners();
  }
}
