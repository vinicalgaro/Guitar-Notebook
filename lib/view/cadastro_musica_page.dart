import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guitar_learner/view/widgets/parte_item_widget.dart';
import 'package:guitar_learner/viewmodel/cadastro_musica_viewmodel.dart';
import 'package:guitar_learner/widgets/default_card_container.dart';
import 'package:guitar_learner/widgets/default_dropdownbutton.dart';
import 'package:guitar_learner/widgets/default_page_scaffold.dart';
import 'package:guitar_learner/widgets/default_stepper.dart';
import 'package:guitar_learner/widgets/default_textformfield.dart';
import 'package:provider/provider.dart';

import '../helpers/helper_toast.dart';
import '../helpers/step_builder.dart';
import '../model/musica/models.dart';
import '../widgets/default_textbutton.dart';

class CadastroMusicaPage extends StatefulWidget {
  const CadastroMusicaPage({super.key});

  @override
  State<CadastroMusicaPage> createState() => _CadastroMusicaPageState();
}

class _CadastroMusicaPageState extends State<CadastroMusicaPage> {
  final _formKeyStep1 = GlobalKey<FormState>();
  final _formKeyStep2 = GlobalKey<FormState>();
  final _parteListKey = GlobalKey<AnimatedListState>();

  late final TextEditingController _nomeMusicaController;
  late final TextEditingController _linkYoutubeController;

  @override
  void initState() {
    super.initState();
    final viewModel = context.read<CadastroMusicaViewModel>();

    _nomeMusicaController =
        TextEditingController(text: viewModel.musicaRascunho.nome);
    _linkYoutubeController =
        TextEditingController(text: viewModel.musicaRascunho.linkYoutube ?? '');
  }

  @override
  void dispose() {
    _nomeMusicaController.dispose();
    _linkYoutubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CadastroMusicaViewModel>();
    final localizations = AppLocalizations.of(context)!;

    return DefaultPageScaffold(
      title:
          viewModel.isEditing ? localizations.editSong : localizations.newSong,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: DefaultCardContainer(
                child: Column(
                  children: [
                    Text(
                        _getCurrentStepText(
                            viewModel.currentStep, localizations),
                        style: const TextStyle(fontStyle: FontStyle.italic)),
                    Text(
                        _getCurrentStepTitle(
                            viewModel.currentStep, localizations),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26)),
                    Text(
                      _getCurrentStepDesc(viewModel.currentStep, localizations),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            DefaultStepper(
              steps: [
                _buildStepDadosMusica(context),
                _buildStepPartesMusica(context),
              ],
              currentStep: viewModel.currentStep,
              onStepTapped: (step) => _onStepTapped(step, context),
              onStepContinue: () => _onStepContinue(context),
              onStepCancel: () => viewModel.onStepCancel(),
            ),
          ],
        ),
      ),
    );
  }

  void _onStepContinue(BuildContext context) async {
    final viewModel = context.read<CadastroMusicaViewModel>();
    final localizations = AppLocalizations.of(context)!;

    if (viewModel.isLastStep) {
      if (_formKeyStep2.currentState!.validate()) {
        final sucesso = await viewModel.salvarMusica();
        if (mounted) {
          if (sucesso) {
            displaySuccessToast(
                localizations.sucessoToast, localizations.sucessoCadastrarMsg);
            Navigator.of(context).pop();
          } else {
            displayErrorToast(
                localizations.errorToast, localizations.erroCadastrarMsg);
          }
        }
      }
    } else {
      if (_formKeyStep1.currentState!.validate()) {
        viewModel.onStepContinue();
      }
    }
  }

  void _onStepTapped(int tappedStep, BuildContext context) {
    final viewModel = context.read<CadastroMusicaViewModel>();

    if (tappedStep < viewModel.currentStep) {
      viewModel.onStepTapped(tappedStep);
      return;
    }

    if (viewModel.currentStep == 0) {
      if (_formKeyStep1.currentState!.validate()) {
        viewModel.onStepTapped(tappedStep);
      }
    } else {
      viewModel.onStepTapped(tappedStep);
    }
  }

  void _adicionarNovaParte() {
    final viewModel = context.read<CadastroMusicaViewModel>();
    viewModel.adicionarNovaParte();
    _parteListKey.currentState
        ?.insertItem(viewModel.partNameControllers.length - 1);
  }

  void _removerParte(int index) {
    final viewModel = context.read<CadastroMusicaViewModel>();
    final removedController = viewModel.partNameControllers[index];
    final removedItemWidget = ParteItemWidget(
      partNameController: removedController,
      index: index + 1,
      onDelete: () {},
    );

    viewModel.removerParte(index);

    _parteListKey.currentState?.removeItem(
      index,
      (context, animation) => FadeTransition(
        opacity: animation,
        child: SizeTransition(
          sizeFactor: animation,
          child: removedItemWidget,
        ),
      ),
    );
  }

  Step _buildStepDadosMusica(BuildContext context) {
    final viewModel = context.read<CadastroMusicaViewModel>();
    final localizations = AppLocalizations.of(context)!;

    return buildStep(
      title: localizations.step1Title,
      content: Form(
        key: _formKeyStep1,
        child: Column(
          children: [
            DefaultTextFormField(
              label: localizations.songName,
              hintText: localizations.hintSongName,
              controller: _nomeMusicaController,
              required: true,
            ),
            const SizedBox(height: 8.0),
            DefaultTextFormField(
              label: localizations.linkYoutube,
              hintText: localizations.hintSongUrl,
              helpText: localizations.helpYoutube,
              controller: _linkYoutubeController,
            ),
            const SizedBox(height: 8.0),
            DefaultDropdownButton<Instrumento>(
              label: localizations.instrumento,
              items: Instrumento.values,
              value: viewModel.musicaRascunho.instrumento,
              onChanged: (selected) {
                if (selected != null) {
                  viewModel.atualizarInstrumento(selected);
                }
              },
              itemBuilder: (item) => Text(item.name),
            ),
          ],
        ),
      ),
      stepIndex: 0,
      currentStep: viewModel.currentStep,
    );
  }

  Step _buildStepPartesMusica(BuildContext context) {
    final viewModel = context.watch<CadastroMusicaViewModel>();
    final localizations = AppLocalizations.of(context)!;

    return buildStep(
      title: localizations.step2Title,
      content: Form(
        key: _formKeyStep2,
        child: Column(
          children: [
            AnimatedList(
              key: _parteListKey,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              initialItemCount: viewModel.partNameControllers.length,
              itemBuilder: (context, index, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, -0.1),
                      end: Offset.zero,
                    ).animate(animation),
                    child: ParteItemWidget(
                      partNameController: viewModel.partNameControllers[index],
                      index: index + 1,
                      onDelete: () => _removerParte(index),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            DefaultTextButton(
              onPressed: _adicionarNovaParte,
              expandText: true,
              showBorder: true,
              child: Text(
                localizations.addParte,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      stepIndex: 1,
      currentStep: viewModel.currentStep,
    );
  }
}

String _getCurrentStepText(int currentStep, AppLocalizations localizations) {
  return "${localizations.step} ${currentStep + 1}";
}

String _getCurrentStepTitle(int currentStep, AppLocalizations localizations) {
  switch (currentStep) {
    case 0:
      return localizations.step1Title;
    case 1:
      return localizations.step2Title;
    default:
      return "";
  }
}

String _getCurrentStepDesc(int currentStep, AppLocalizations localizations) {
  switch (currentStep) {
    case 0:
      return localizations.step1Desc;
    case 1:
      return localizations.step2Desc;
    default:
      return "";
  }
}
