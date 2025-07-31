import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../model/settings_repository.dart';

class ThemeViewModel extends ChangeNotifier with WidgetsBindingObserver {
  final SettingsRepository _settingsRepository;

  ThemeMode _themeMode;

  ThemeViewModel(this._settingsRepository) : _themeMode = ThemeMode.system {
    WidgetsBinding.instance.addObserver(this);
    _loadTheme();
  }

  bool get isDarkMode {
    if (_themeMode == ThemeMode.system) {
      // Se a preferência é 'system', consulte o estado real do dispositivo
      return SchedulerBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;
    } else {
      return _themeMode == ThemeMode.dark;
    }
  }

  ThemeMode get themeMode => _themeMode;

  void _loadTheme() async {
    _themeMode = await _settingsRepository.getThemePreference();
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    await _settingsRepository.saveThemePreference(mode);
    notifyListeners();
  }

  @override
  void didChangePlatformBrightness() {
    // Se a preferência do usuário é seguir o sistema,
    // precisamos notificar a UI para que ela se reconstrua com o novo estado.
    if (_themeMode == ThemeMode.system) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
