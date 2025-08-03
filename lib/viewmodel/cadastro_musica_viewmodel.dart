import 'package:flutter/cupertino.dart';

import '../model/musica/models.dart';

class CadastroMusicaViewModel extends ChangeNotifier {
  final int _maxPartes = 4;
  final int _maxRitmos = 8;

  late Musica _musicaRascunho;
  late bool _isEditing;
  int _currentStep = 0;
  final List<TextEditingController> partNameControllers = [];

  CadastroMusicaViewModel({Musica? musica}) {
    _isEditing = musica != null;

    if (musica != null) {
      _musicaRascunho = musica;
      for (var parte in _musicaRascunho.partes) {
        _adicionarController(texto: parte.nome);
      }
    } else {
      _musicaRascunho = const Musica(
        nome: '',
        instrumento: Instrumento.violao,
        partes: [],
      );
      adicionarNovaParte();
    }
  }

  Musica get musicaRascunho => _musicaRascunho;

  int get currentStep => _currentStep;

  bool get isLastStep => _currentStep == 1;

  bool get isEditing => _isEditing;

  bool get podeAdicionarParte => _musicaRascunho.partes.length < _maxPartes;

  bool podeAdicionarRitmo(int partIndex) =>
      _musicaRascunho.partes[partIndex].ritmo.batidas.length < _maxRitmos;

  void _adicionarController({String texto = ''}) {
    final controller = TextEditingController(text: texto);
    partNameControllers.add(controller);
  }

  void adicionarNovaParte() {
    final novaParte = Parte(
      nome: '',
      ritmo: Ritmo([]),
      sequencia: Sequencia([]),
    );
    _musicaRascunho = _musicaRascunho.copyWith(
      partes: [..._musicaRascunho.partes, novaParte],
    );
    _adicionarController();
    notifyListeners();
  }

  void removerParte(int index) {
    partNameControllers.removeAt(index);

    final novasPartes = List<Parte>.from(_musicaRascunho.partes);
    novasPartes.removeAt(index);
    _musicaRascunho = _musicaRascunho.copyWith(partes: novasPartes);
    notifyListeners();
  }

  void onStepTapped(int step) {
    _currentStep = step;
    notifyListeners();
  }

  void onStepContinue() {
    _currentStep++;
    notifyListeners();
  }

  void onStepCancel() {
    if (_currentStep > 0) {
      _currentStep--;
      notifyListeners();
    }
  }

  void atualizarInstrumento(Instrumento instrumento) {
    _musicaRascunho = _musicaRascunho.copyWith(instrumento: instrumento);
    notifyListeners();
  }

  Future<void> salvarMusica() async {
    for (int i = 0; i < _musicaRascunho.partes.length; i++) {
      final parteAntiga = _musicaRascunho.partes[i];
      final novasPartes = List<Parte>.from(_musicaRascunho.partes);
      novasPartes[i] = parteAntiga.copyWith(
        nome: partNameControllers[i].text.trim(),
      );
      _musicaRascunho = _musicaRascunho.copyWith(partes: novasPartes);
    }

    // ToDo: Chamar o Repository para salvar de fato os dados
  }

  void adicionarBatida(int partIndex, Batida batida) {
    _musicaRascunho.partes[partIndex].ritmo.batidas.add(batida);
    notifyListeners();
  }

  void removerBatida(int partIndex, int batidaIndex) {
    _musicaRascunho.partes[partIndex].ritmo.batidas.removeAt(batidaIndex);
    notifyListeners();
  }

  void clearBatidas(int partIndex) {
    _musicaRascunho.partes[partIndex].ritmo.batidas.clear();
    notifyListeners();
  }

  void reorganizarBatidas(int partIndex, int oldIndex, int newIndex) {
    final parte = _musicaRascunho.partes[partIndex];
    final batidas = parte.ritmo.batidas;

    final batida = batidas.removeAt(oldIndex);
    batidas.insert(newIndex, batida);

    notifyListeners();
  }

  void adicionarSequencia(int partIndex, Sequencia sequencia) {
    _musicaRascunho.partes[partIndex].sequencia.compassos
      ..clear()
      ..addAll(sequencia.compassos);
    notifyListeners();
  }

  void removerCompasso(int partIndex, int compassoIndex) {
    _musicaRascunho.partes[partIndex].sequencia.compassos
        .removeAt(compassoIndex);
    notifyListeners();
  }

  void clearSequencia(int partIndex) {
    _musicaRascunho.partes[partIndex].sequencia.compassos.clear();
    notifyListeners();
  }

  void reorganizarCompassos(int partIndex, int oldIndex, int newIndex) {
    final parte = _musicaRascunho.partes[partIndex];
    final batidas = parte.sequencia.compassos;

    final batida = batidas.removeAt(oldIndex);
    batidas.insert(newIndex, batida);

    notifyListeners();
  }

  @override
  void dispose() {
    for (var controller in partNameControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
