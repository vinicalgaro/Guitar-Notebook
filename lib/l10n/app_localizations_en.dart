// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Guitar Learner';

  @override
  String get menu => 'Menu';

  @override
  String get settings => 'Settings';

  @override
  String get about => 'About';

  @override
  String get newSong => 'New Song';

  @override
  String get editSong => 'Edit Song';

  @override
  String get tema => 'Theme';

  @override
  String get temaEscuro => 'Dark Mode';

  @override
  String get linkedin => 'LinkedIn';

  @override
  String get mobileDeveloper => 'Mobile Developer';

  @override
  String get vinciusCalgaro => 'Vinícius Calgaro';

  @override
  String get github => 'GitHub';

  @override
  String version(String versionNumber) {
    return 'Version $versionNumber';
  }

  @override
  String get aboutAppText =>
      'This app was developed to help musicians organize their practice, track their progress, and master their favorite songs.';

  @override
  String get dev => 'Developer';

  @override
  String get appLema => 'Practice today, get better always!';

  @override
  String get step1Title => 'Song Data';

  @override
  String get step1Desc =>
      'Fill in the basic details of the song. The title is essential to find it later.';

  @override
  String get step2Title => 'Song Parts';

  @override
  String get step2Desc =>
      ' Define the song structure with sections, rhythm, and chords. Add as many parts as you like.';

  @override
  String get step => 'Step';

  @override
  String get fieldRequired => 'Required field';

  @override
  String get optional => 'Optional';

  @override
  String get songName => 'Song Name';

  @override
  String get linkYoutube => 'Youtube Link';

  @override
  String get partName => 'Part Name';

  @override
  String get salvar => 'Save';

  @override
  String get voltar => 'Back';

  @override
  String get continuar => 'Continue';

  @override
  String get hintSongName => 'e.g., Californication';

  @override
  String get hintSongUrl => 'e.g., https://youtu.be/YlUKcNNmywk';

  @override
  String get hintSongPart => 'e.g., Intro';

  @override
  String get helpYoutube =>
      'Paste the link to the original song or a video lesson for reference.';

  @override
  String get sucessoToast => 'All set';

  @override
  String get sucessoCadastrarMsg => 'Suas alterações foram salvas com sucesso!';

  @override
  String get errorToast => ':(';

  @override
  String get erroCadastrarMsg => 'Failed to save your changes.';

  @override
  String get help => 'Help';

  @override
  String get saberMais => 'Learn More';

  @override
  String get addParte => 'Add New Part';

  @override
  String get part => 'Part';

  @override
  String get ritmo => 'Rhythm';

  @override
  String get sequencia => 'Sequence';

  @override
  String get instrumento => 'Instrument';

  @override
  String get nenhumaBatidaAdicionada => 'No beat has been added yet.';

  @override
  String get atencao => 'Atention!';

  @override
  String get limiteDeBatidasAtingido => 'Beat limit reached.';

  @override
  String get nenhumaSequenciaAdicionada => 'No sequence has been added yet';

  @override
  String get selecionar => 'Select';

  @override
  String get limiteDeSequenciasAtingido => 'Sequence limit reached.';

  @override
  String get settingsDesc => 'Customize your experience in the app.';

  @override
  String get content => 'Content';

  @override
  String get preferences => 'Preferences';

  @override
  String get linguagem => 'Language';

  @override
  String get idiomaAlterado => 'Language changed!';

  @override
  String get temaAlterado => 'Theme changed!';

  @override
  String get violao => 'Acoustic Guitar';

  @override
  String get guitarra => 'Eletric Guitar';

  @override
  String get ukelele => 'Ukulele';

  @override
  String get deletar => 'Delete';

  @override
  String get editar => 'Edit';

  @override
  String get deletarWarning => 'Are you sure you want to delete this song?';

  @override
  String get mySongs => 'My Songs';

  @override
  String get mySongsDesc => 'Practice with your songs!';

  @override
  String get errorLoadingMusics => 'Failed to load songs :(';

  @override
  String get noMusics => 'Any songs added yet :(';

  @override
  String get songDeleted => 'Song deleted!';

  @override
  String get praticar => 'Practice';

  @override
  String get semMusicaPraticada =>
      'Silent... we haven\'t played any chords yet. Let\'s start your musical journey?';

  @override
  String get progresso => 'Your Progress';

  @override
  String get progressoDesc => 'Continue where you left off!';

  @override
  String get maior => 'Major';

  @override
  String get menor => 'Minor';

  @override
  String get outro => 'Other';

  @override
  String get nota_C => 'C';

  @override
  String get nota_D => 'D';

  @override
  String get nota_E => 'E';

  @override
  String get nota_F => 'F';

  @override
  String get nota_G => 'G';

  @override
  String get nota_A => 'A';

  @override
  String get nota_B => 'B';

  @override
  String get afinacao => 'Tuning';

  @override
  String get revise => 'Revise the required fields.';
}
