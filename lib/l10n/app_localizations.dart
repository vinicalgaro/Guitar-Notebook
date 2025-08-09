import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In pt, this message translates to:
  /// **'Guitar Notebook'**
  String get appTitle;

  /// No description provided for @menu.
  ///
  /// In pt, this message translates to:
  /// **'Menu'**
  String get menu;

  /// No description provided for @settings.
  ///
  /// In pt, this message translates to:
  /// **'Configurações'**
  String get settings;

  /// No description provided for @about.
  ///
  /// In pt, this message translates to:
  /// **'Sobre'**
  String get about;

  /// No description provided for @newSong.
  ///
  /// In pt, this message translates to:
  /// **'Nova Música'**
  String get newSong;

  /// No description provided for @editSong.
  ///
  /// In pt, this message translates to:
  /// **'Editar Música'**
  String get editSong;

  /// No description provided for @tema.
  ///
  /// In pt, this message translates to:
  /// **'Tema'**
  String get tema;

  /// No description provided for @temaEscuro.
  ///
  /// In pt, this message translates to:
  /// **'Tema Escuro'**
  String get temaEscuro;

  /// No description provided for @linkedin.
  ///
  /// In pt, this message translates to:
  /// **'LinkedIn'**
  String get linkedin;

  /// No description provided for @mobileDeveloper.
  ///
  /// In pt, this message translates to:
  /// **'Mobile Developer'**
  String get mobileDeveloper;

  /// No description provided for @vinciusCalgaro.
  ///
  /// In pt, this message translates to:
  /// **'Vinícius Calgaro'**
  String get vinciusCalgaro;

  /// No description provided for @github.
  ///
  /// In pt, this message translates to:
  /// **'GitHub'**
  String get github;

  /// Texto para mostrar a versão atual do aplicativo.
  ///
  /// In pt, this message translates to:
  /// **'Versão {versionNumber}'**
  String version(String versionNumber);

  /// No description provided for @aboutAppText.
  ///
  /// In pt, this message translates to:
  /// **'Este aplicativo foi desenvolvido para ajudar músicos a organizar seus estudos, registrar o progresso e dominar suas músicas favoritas.'**
  String get aboutAppText;

  /// No description provided for @dev.
  ///
  /// In pt, this message translates to:
  /// **'Desenvolvedor'**
  String get dev;

  /// No description provided for @step1Title.
  ///
  /// In pt, this message translates to:
  /// **'Dados da Música'**
  String get step1Title;

  /// No description provided for @step1Desc.
  ///
  /// In pt, this message translates to:
  /// **'Preencha as informações básicas da música. O título é essencial para encontrá-la depois.'**
  String get step1Desc;

  /// No description provided for @step2Title.
  ///
  /// In pt, this message translates to:
  /// **'Partes da Música'**
  String get step2Title;

  /// No description provided for @step2Desc.
  ///
  /// In pt, this message translates to:
  /// **' Defina a estrutura da música com seções, ritmos e acordes. Adicione quantas partes quiser.'**
  String get step2Desc;

  /// No description provided for @step.
  ///
  /// In pt, this message translates to:
  /// **'Passo'**
  String get step;

  /// No description provided for @fieldRequired.
  ///
  /// In pt, this message translates to:
  /// **'Campo obrigatório'**
  String get fieldRequired;

  /// No description provided for @optional.
  ///
  /// In pt, this message translates to:
  /// **'Opcional'**
  String get optional;

  /// No description provided for @songName.
  ///
  /// In pt, this message translates to:
  /// **'Nome da Música'**
  String get songName;

  /// No description provided for @linkYoutube.
  ///
  /// In pt, this message translates to:
  /// **'Link do Youtube'**
  String get linkYoutube;

  /// No description provided for @partName.
  ///
  /// In pt, this message translates to:
  /// **'Nome da Parte'**
  String get partName;

  /// No description provided for @salvar.
  ///
  /// In pt, this message translates to:
  /// **'Salvar'**
  String get salvar;

  /// No description provided for @voltar.
  ///
  /// In pt, this message translates to:
  /// **'Voltar'**
  String get voltar;

  /// No description provided for @continuar.
  ///
  /// In pt, this message translates to:
  /// **'Continuar'**
  String get continuar;

  /// No description provided for @hintSongName.
  ///
  /// In pt, this message translates to:
  /// **'Ex.: Californication'**
  String get hintSongName;

  /// No description provided for @hintSongUrl.
  ///
  /// In pt, this message translates to:
  /// **'Ex.: https://youtu.be/YlUKcNNmywk'**
  String get hintSongUrl;

  /// No description provided for @hintSongPart.
  ///
  /// In pt, this message translates to:
  /// **'Ex.: Intro'**
  String get hintSongPart;

  /// No description provided for @helpYoutube.
  ///
  /// In pt, this message translates to:
  /// **'Cole o link da música original ou de uma videoaula para referência.'**
  String get helpYoutube;

  /// No description provided for @sucessoToast.
  ///
  /// In pt, this message translates to:
  /// **'Pronto'**
  String get sucessoToast;

  /// No description provided for @sucessoCadastrarMsg.
  ///
  /// In pt, this message translates to:
  /// **'Suas alterações foram salvas com sucesso!'**
  String get sucessoCadastrarMsg;

  /// No description provided for @errorToast.
  ///
  /// In pt, this message translates to:
  /// **':('**
  String get errorToast;

  /// No description provided for @erroCadastrarMsg.
  ///
  /// In pt, this message translates to:
  /// **'Falha ao salvar suas alterações.'**
  String get erroCadastrarMsg;

  /// No description provided for @help.
  ///
  /// In pt, this message translates to:
  /// **'Ajuda'**
  String get help;

  /// No description provided for @saberMais.
  ///
  /// In pt, this message translates to:
  /// **'Saber Mais'**
  String get saberMais;

  /// No description provided for @addParte.
  ///
  /// In pt, this message translates to:
  /// **'Adicionar Nova Parte'**
  String get addParte;

  /// No description provided for @part.
  ///
  /// In pt, this message translates to:
  /// **'Parte'**
  String get part;

  /// No description provided for @ritmo.
  ///
  /// In pt, this message translates to:
  /// **'Ritmo'**
  String get ritmo;

  /// No description provided for @sequencia.
  ///
  /// In pt, this message translates to:
  /// **'Sequência'**
  String get sequencia;

  /// No description provided for @instrumento.
  ///
  /// In pt, this message translates to:
  /// **'Instrumento'**
  String get instrumento;

  /// No description provided for @nenhumaBatidaAdicionada.
  ///
  /// In pt, this message translates to:
  /// **'Nenhuma batida adicionada.'**
  String get nenhumaBatidaAdicionada;

  /// No description provided for @atencao.
  ///
  /// In pt, this message translates to:
  /// **'Atenção!'**
  String get atencao;

  /// No description provided for @limiteDeBatidasAtingido.
  ///
  /// In pt, this message translates to:
  /// **'Limite de batidas atingido.'**
  String get limiteDeBatidasAtingido;

  /// No description provided for @nenhumaSequenciaAdicionada.
  ///
  /// In pt, this message translates to:
  /// **'Nenhuma sequência adicionada.'**
  String get nenhumaSequenciaAdicionada;

  /// No description provided for @selecionar.
  ///
  /// In pt, this message translates to:
  /// **'Selecionar'**
  String get selecionar;

  /// No description provided for @limiteDeSequenciasAtingido.
  ///
  /// In pt, this message translates to:
  /// **'Limite de sequência atingido.'**
  String get limiteDeSequenciasAtingido;

  /// No description provided for @settingsDesc.
  ///
  /// In pt, this message translates to:
  /// **'Personalize a sua experiência no app.'**
  String get settingsDesc;

  /// No description provided for @content.
  ///
  /// In pt, this message translates to:
  /// **'Conteúdo'**
  String get content;

  /// No description provided for @preferences.
  ///
  /// In pt, this message translates to:
  /// **'Preferências'**
  String get preferences;

  /// No description provided for @linguagem.
  ///
  /// In pt, this message translates to:
  /// **'Linguagem'**
  String get linguagem;

  /// No description provided for @idiomaAlterado.
  ///
  /// In pt, this message translates to:
  /// **'Idioma alterado!'**
  String get idiomaAlterado;

  /// No description provided for @temaAlterado.
  ///
  /// In pt, this message translates to:
  /// **'Tema alterado!'**
  String get temaAlterado;

  /// No description provided for @violao.
  ///
  /// In pt, this message translates to:
  /// **'Violão'**
  String get violao;

  /// No description provided for @guitarra.
  ///
  /// In pt, this message translates to:
  /// **'Guitarra'**
  String get guitarra;

  /// No description provided for @ukelele.
  ///
  /// In pt, this message translates to:
  /// **'Ukelele'**
  String get ukelele;

  /// No description provided for @deletar.
  ///
  /// In pt, this message translates to:
  /// **'Deletar'**
  String get deletar;

  /// No description provided for @editar.
  ///
  /// In pt, this message translates to:
  /// **'Editar'**
  String get editar;

  /// No description provided for @deletarWarning.
  ///
  /// In pt, this message translates to:
  /// **'Tem certeza que deseja deletar essa música?'**
  String get deletarWarning;

  /// No description provided for @mySongs.
  ///
  /// In pt, this message translates to:
  /// **'Minhas Músicas'**
  String get mySongs;

  /// No description provided for @mySongsDesc.
  ///
  /// In pt, this message translates to:
  /// **'Pratique com suas músicas!'**
  String get mySongsDesc;

  /// No description provided for @errorLoadingMusics.
  ///
  /// In pt, this message translates to:
  /// **'Falha ao carregar músicas :('**
  String get errorLoadingMusics;

  /// No description provided for @noMusics.
  ///
  /// In pt, this message translates to:
  /// **'Nenhuma música cadastrada :('**
  String get noMusics;

  /// No description provided for @songDeleted.
  ///
  /// In pt, this message translates to:
  /// **'Música deletada!'**
  String get songDeleted;

  /// No description provided for @praticar.
  ///
  /// In pt, this message translates to:
  /// **'Praticar'**
  String get praticar;

  /// No description provided for @semMusicaPraticada.
  ///
  /// In pt, this message translates to:
  /// **'Silêncio... ainda não temos acordes tocados por aqui.'**
  String get semMusicaPraticada;

  /// No description provided for @progresso.
  ///
  /// In pt, this message translates to:
  /// **'Seu Progresso'**
  String get progresso;

  /// No description provided for @progressoDesc.
  ///
  /// In pt, this message translates to:
  /// **'Continue de onde parou!'**
  String get progressoDesc;

  /// No description provided for @maior.
  ///
  /// In pt, this message translates to:
  /// **'Maior'**
  String get maior;

  /// No description provided for @menor.
  ///
  /// In pt, this message translates to:
  /// **'Menor'**
  String get menor;

  /// No description provided for @outro.
  ///
  /// In pt, this message translates to:
  /// **'Outro'**
  String get outro;

  /// No description provided for @nota_C.
  ///
  /// In pt, this message translates to:
  /// **'Dó'**
  String get nota_C;

  /// No description provided for @nota_D.
  ///
  /// In pt, this message translates to:
  /// **'Ré'**
  String get nota_D;

  /// No description provided for @nota_E.
  ///
  /// In pt, this message translates to:
  /// **'Mi'**
  String get nota_E;

  /// No description provided for @nota_F.
  ///
  /// In pt, this message translates to:
  /// **'Fá'**
  String get nota_F;

  /// No description provided for @nota_G.
  ///
  /// In pt, this message translates to:
  /// **'Sol'**
  String get nota_G;

  /// No description provided for @nota_A.
  ///
  /// In pt, this message translates to:
  /// **'Lá'**
  String get nota_A;

  /// No description provided for @nota_B.
  ///
  /// In pt, this message translates to:
  /// **'Si'**
  String get nota_B;

  /// No description provided for @afinacao.
  ///
  /// In pt, this message translates to:
  /// **'Afinação'**
  String get afinacao;

  /// No description provided for @revise.
  ///
  /// In pt, this message translates to:
  /// **'Revise os campos obrigatórios.'**
  String get revise;

  /// No description provided for @afinacaoPadrao.
  ///
  /// In pt, this message translates to:
  /// **'Padrão'**
  String get afinacaoPadrao;

  /// No description provided for @afinacaoDropD.
  ///
  /// In pt, this message translates to:
  /// **'Drop D'**
  String get afinacaoDropD;

  /// No description provided for @afinacaoPadraoC.
  ///
  /// In pt, this message translates to:
  /// **'Padrão C (High G)'**
  String get afinacaoPadraoC;

  /// No description provided for @afinacaoLowG.
  ///
  /// In pt, this message translates to:
  /// **'Low G'**
  String get afinacaoLowG;

  /// No description provided for @ajustesPlayer.
  ///
  /// In pt, this message translates to:
  /// **'Ajustes'**
  String get ajustesPlayer;

  /// No description provided for @song.
  ///
  /// In pt, this message translates to:
  /// **'Música'**
  String get song;

  /// No description provided for @nenhumLink.
  ///
  /// In pt, this message translates to:
  /// **'Nenhum link encontrado.'**
  String get nenhumLink;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
