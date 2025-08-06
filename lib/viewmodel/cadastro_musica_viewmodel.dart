import 'package:flutter/cupertino.dart';

import '../model/musica/models.dart';
import '../model/repository/acorde_repository.dart';
import '../model/repository/musica_repository.dart';

class CadastroMusicaViewModel extends ChangeNotifier {
  final IMusicaRepository _musicaRepository;
  final IAcordeRepository _acordeRepository;

  final int _maxPartes = 4;
  final int _maxRitmos = 8;

  late Musica _musicaRascunho;
  late bool _isEditing;
  int _currentStep = 0;
  final List<TextEditingController> partNameControllers = [];

  List<Afinacao> _afinacoesDisponiveis = [];
  Afinacao? _afinacaoSelecionada;
  bool _carregandoAfinacoes = true;

  CadastroMusicaViewModel(
      {Musica? musica,
      required IMusicaRepository repository,
      required IAcordeRepository acordeRepository})
      : _musicaRepository = repository,
        _acordeRepository = acordeRepository {
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
        afinacaoId: 0,
        partes: [],
      );
      adicionarNovaParte();
    }
    _inicializarAfinacoes();
  }

  Musica get musicaRascunho => _musicaRascunho;

  int get currentStep => _currentStep;

  bool get isLastStep => _currentStep == 1;

  bool get isEditing => _isEditing;

  List<Afinacao> get afinacoesDisponiveis => _afinacoesDisponiveis;

  Afinacao? get afinacaoSelecionada => _afinacaoSelecionada;

  bool get carregandoAfinacoes => _carregandoAfinacoes;

  bool get podeAdicionarParte => _musicaRascunho.partes.length < _maxPartes;

  Future<void> _inicializarAfinacoes() async {
    await atualizarInstrumento(_musicaRascunho.instrumento);
    if (_isEditing) {
      _afinacaoSelecionada = _afinacoesDisponiveis
          .firstWhere((a) => a.id == _musicaRascunho.afinacaoId);
    }
    notifyListeners();
  }

  Future<void> atualizarInstrumento(Instrumento instrumento) async {
    _carregandoAfinacoes = true;
    _musicaRascunho = _musicaRascunho.copyWith(instrumento: instrumento);
    _afinacaoSelecionada = null;
    notifyListeners();

    _afinacoesDisponiveis =
        await _acordeRepository.getAfinacoesPorInstrumento(instrumento);

    if (_afinacoesDisponiveis.isNotEmpty) {
      _afinacaoSelecionada = _afinacoesDisponiveis.first;
      _musicaRascunho =
          _musicaRascunho.copyWith(afinacaoId: _afinacaoSelecionada!.id);
    }
    _carregandoAfinacoes = false;
    notifyListeners();
  }

  void atualizarAfinacao(Afinacao? afinacao) {
    _afinacaoSelecionada = afinacao;
    if (afinacao != null) {
      _musicaRascunho = _musicaRascunho.copyWith(afinacaoId: afinacao.id);
    }
    notifyListeners();
  }

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

  Future<void> salvarMusica(
      {required String nomeMusica, required String linkYoutube}) async {
    final novasPartes = _musicaRascunho.partes.asMap().entries.map((entry) {
      int index = entry.key;
      Parte parteAntiga = entry.value;

      return parteAntiga.copyWith(
        nome: partNameControllers[index].text.trim(),
      );
    }).toList();

    _musicaRascunho = _musicaRascunho.copyWith(
      nome: nomeMusica.trim(),
      linkYoutube: linkYoutube.trim(),
      partes: novasPartes,
    );

    await _musicaRepository.salvarMusica(_musicaRascunho);
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
