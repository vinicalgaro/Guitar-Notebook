import 'dart:ui';

extension LocaleDisplayName on Locale {
  String toDisplayName() {
    switch (languageCode) {
      case 'pt':
        return 'Português';
      case 'en':
        return 'English';
      default:
        return languageCode;
    }
  }
}
