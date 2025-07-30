// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Guitar Learner`
  String get appTitle {
    return Intl.message(
      'Guitar Learner',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get menu {
    return Intl.message(
      'Menu',
      name: 'menu',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `New Song`
  String get newSong {
    return Intl.message(
      'New Song',
      name: 'newSong',
      desc: '',
      args: [],
    );
  }

  /// `Edit Song`
  String get editSong {
    return Intl.message(
      'Edit Song',
      name: 'editSong',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get modoEscuro {
    return Intl.message(
      'Dark Theme',
      name: 'modoEscuro',
      desc: '',
      args: [],
    );
  }

  /// `Version {versionNumber}`
  String version(String versionNumber) {
    return Intl.message(
      'Version $versionNumber',
      name: 'version',
      desc: 'Text to show the current app version.',
      args: [versionNumber],
    );
  }

  /// `This app was developed to help musicians organize their practice, track their progress, and master their favorite songs.`
  String get aboutAppText {
    return Intl.message(
      'This app was developed to help musicians organize their practice, track their progress, and master their favorite songs.',
      name: 'aboutAppText',
      desc: '',
      args: [],
    );
  }

  /// `Developer`
  String get dev {
    return Intl.message(
      'Developer',
      name: 'dev',
      desc: '',
      args: [],
    );
  }

  /// `Practice today, get better always!`
  String get appLema {
    return Intl.message(
      'Practice today, get better always!',
      name: 'appLema',
      desc: '',
      args: [],
    );
  }

  /// `Song Data`
  String get step1Title {
    return Intl.message(
      'Song Data',
      name: 'step1Title',
      desc: '',
      args: [],
    );
  }

  /// `To start, fill in the main details to identify the song. The title is essential so you can find it later.`
  String get step1Desc {
    return Intl.message(
      'To start, fill in the main details to identify the song. The title is essential so you can find it later.',
      name: 'step1Desc',
      desc: '',
      args: [],
    );
  }

  /// `Song Parts`
  String get step2Title {
    return Intl.message(
      'Song Parts',
      name: 'step2Title',
      desc: '',
      args: [],
    );
  }

  /// `In this step, you'll define the song's structure. Create the different sections and fill in their corresponding rhythm and chord progression. You can add as many parts as you need.`
  String get step2Desc {
    return Intl.message(
      'In this step, you\'ll define the song\'s structure. Create the different sections and fill in their corresponding rhythm and chord progression. You can add as many parts as you need.',
      name: 'step2Desc',
      desc: '',
      args: [],
    );
  }

  /// `Step`
  String get step {
    return Intl.message(
      'Step',
      name: 'step',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
