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

  /// `Theme`
  String get tema {
    return Intl.message(
      'Theme',
      name: 'tema',
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

  /// `Fill in the basic details of the song. The title is essential to find it later.`
  String get step1Desc {
    return Intl.message(
      'Fill in the basic details of the song. The title is essential to find it later.',
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

  /// ` Define the song structure with sections, rhythm, and chords. Add as many parts as you like.`
  String get step2Desc {
    return Intl.message(
      ' Define the song structure with sections, rhythm, and chords. Add as many parts as you like.',
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

  /// `Required field`
  String get fieldRequired {
    return Intl.message(
      'Required field',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Optional`
  String get optional {
    return Intl.message(
      'Optional',
      name: 'optional',
      desc: '',
      args: [],
    );
  }

  /// `Song Name`
  String get songName {
    return Intl.message(
      'Song Name',
      name: 'songName',
      desc: '',
      args: [],
    );
  }

  /// `Youtube Link`
  String get linkYoutube {
    return Intl.message(
      'Youtube Link',
      name: 'linkYoutube',
      desc: '',
      args: [],
    );
  }

  /// `Part Name`
  String get partName {
    return Intl.message(
      'Part Name',
      name: 'partName',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get salvar {
    return Intl.message(
      'Save',
      name: 'salvar',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get voltar {
    return Intl.message(
      'Back',
      name: 'voltar',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continuar {
    return Intl.message(
      'Continue',
      name: 'continuar',
      desc: '',
      args: [],
    );
  }

  /// `e.g., Californication`
  String get hintSongName {
    return Intl.message(
      'e.g., Californication',
      name: 'hintSongName',
      desc: '',
      args: [],
    );
  }

  /// `e.g., https://youtu.be/YlUKcNNmywk`
  String get hintSongUrl {
    return Intl.message(
      'e.g., https://youtu.be/YlUKcNNmywk',
      name: 'hintSongUrl',
      desc: '',
      args: [],
    );
  }

  /// `e.g., Intro`
  String get hintSongPart {
    return Intl.message(
      'e.g., Intro',
      name: 'hintSongPart',
      desc: '',
      args: [],
    );
  }

  /// `Paste the link to the original song or a video lesson for reference.`
  String get helpYoutube {
    return Intl.message(
      'Paste the link to the original song or a video lesson for reference.',
      name: 'helpYoutube',
      desc: '',
      args: [],
    );
  }

  /// `All set`
  String get sucessoToast {
    return Intl.message(
      'All set',
      name: 'sucessoToast',
      desc: '',
      args: [],
    );
  }

  /// `Your changes have been saved successfully!`
  String get sucessoMsg {
    return Intl.message(
      'Your changes have been saved successfully!',
      name: 'sucessoMsg',
      desc: '',
      args: [],
    );
  }

  /// `Failed to save your changes.`
  String get erroCadastrarMsg {
    return Intl.message(
      'Failed to save your changes.',
      name: 'erroCadastrarMsg',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Learn More`
  String get saberMais {
    return Intl.message(
      'Learn More',
      name: 'saberMais',
      desc: '',
      args: [],
    );
  }

  /// `Add New Part`
  String get addParte {
    return Intl.message(
      'Add New Part',
      name: 'addParte',
      desc: '',
      args: [],
    );
  }

  /// `Part`
  String get part {
    return Intl.message(
      'Part',
      name: 'part',
      desc: '',
      args: [],
    );
  }

  /// `Rhythm`
  String get ritmo {
    return Intl.message(
      'Rhythm',
      name: 'ritmo',
      desc: '',
      args: [],
    );
  }

  /// `Sequence`
  String get sequencia {
    return Intl.message(
      'Sequence',
      name: 'sequencia',
      desc: '',
      args: [],
    );
  }

  /// `Instrument`
  String get instrumento {
    return Intl.message(
      'Instrument',
      name: 'instrumento',
      desc: '',
      args: [],
    );
  }

  /// `No beat has been added yet.`
  String get nenhumaBatidaAdicionada {
    return Intl.message(
      'No beat has been added yet.',
      name: 'nenhumaBatidaAdicionada',
      desc: '',
      args: [],
    );
  }

  /// `Atention!`
  String get atencao {
    return Intl.message(
      'Atention!',
      name: 'atencao',
      desc: '',
      args: [],
    );
  }

  /// `Beat limit reached.`
  String get limiteDeBatidasAtingido {
    return Intl.message(
      'Beat limit reached.',
      name: 'limiteDeBatidasAtingido',
      desc: '',
      args: [],
    );
  }

  /// `No sequence has been added yet`
  String get nenhumaSequenciaAdicionada {
    return Intl.message(
      'No sequence has been added yet',
      name: 'nenhumaSequenciaAdicionada',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get selecionar {
    return Intl.message(
      'Select',
      name: 'selecionar',
      desc: '',
      args: [],
    );
  }

  /// `Sequence limit reached.`
  String get limiteDeSequenciasAtingido {
    return Intl.message(
      'Sequence limit reached.',
      name: 'limiteDeSequenciasAtingido',
      desc: '',
      args: [],
    );
  }

  /// `Customize your experience in the app.`
  String get settingsDesc {
    return Intl.message(
      'Customize your experience in the app.',
      name: 'settingsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Content`
  String get content {
    return Intl.message(
      'Content',
      name: 'content',
      desc: '',
      args: [],
    );
  }

  /// `Preferences`
  String get preferences {
    return Intl.message(
      'Preferences',
      name: 'preferences',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get linguagem {
    return Intl.message(
      'Language',
      name: 'linguagem',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get temaEscuro {
    return Intl.message(
      'Dark Mode',
      name: 'temaEscuro',
      desc: '',
      args: [],
    );
  }

  /// `Language changed!`
  String get idiomaAlterado {
    return Intl.message(
      'Language changed!',
      name: 'idiomaAlterado',
      desc: '',
      args: [],
    );
  }

  /// `Theme changed!`
  String get temaAlterado {
    return Intl.message(
      'Theme changed!',
      name: 'temaAlterado',
      desc: '',
      args: [],
    );
  }

  /// `Acoustic Guitar`
  String get violao {
    return Intl.message(
      'Acoustic Guitar',
      name: 'violao',
      desc: '',
      args: [],
    );
  }

  /// `Eletric Guitar`
  String get guitarra {
    return Intl.message(
      'Eletric Guitar',
      name: 'guitarra',
      desc: '',
      args: [],
    );
  }

  /// `Ukulele`
  String get ukelele {
    return Intl.message(
      'Ukulele',
      name: 'ukelele',
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
