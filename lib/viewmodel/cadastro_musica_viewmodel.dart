import 'package:flutter/cupertino.dart';

import '../model/musica/models.dart';

class CadastroMusicaViewModel extends ChangeNotifier {
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
        instrumento: Instrumento.guitarra,
        partes: [],
      );
      adicionarNovaParte();
    }
  }

  Musica get musicaRascunho => _musicaRascunho;

  int get currentStep => _currentStep;

  bool get isLastStep => _currentStep == 1;

  bool get isEditing => _isEditing;

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
    partNameControllers[index].dispose();
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
    if (isLastStep) {
      salvarMusica();
    } else {
      _currentStep++;
      notifyListeners();
    }
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

  Future<bool> salvarMusica() async {
    final isPartNamesValid =
        partNameControllers.every((c) => c.text.trim().isNotEmpty);

    if (isPartNamesValid) {
      for (int i = 0; i < _musicaRascunho.partes.length; i++) {
        final parteAntiga = _musicaRascunho.partes[i];
        final novasPartes = List<Parte>.from(_musicaRascunho.partes);
        novasPartes[i] = parteAntiga.copyWith(
          nome: partNameControllers[i].text.trim(),
        );
        _musicaRascunho = _musicaRascunho.copyWith(partes: novasPartes);
      }

      // ToDo: Chamar o Repository para salvar de fato os dados
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    for (var controller in partNameControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
