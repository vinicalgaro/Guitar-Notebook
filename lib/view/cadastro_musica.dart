import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guitar_learner/extensions/navigation_extension.dart';
import 'package:guitar_learner/helpers/helper_toast.dart';
import 'package:guitar_learner/widgets/default_card_container.dart';
import 'package:guitar_learner/widgets/default_page_scaffold.dart';
import 'package:guitar_learner/widgets/default_stepper.dart';
import 'package:guitar_learner/widgets/default_textformfield.dart';

import '../helpers/step_builder.dart';

class CadastroMusica extends StatefulWidget {
  final Object? musica;

  const CadastroMusica({super.key, this.musica});

  @override
  State<CadastroMusica> createState() => _CadastroMusicaState();
}

class _CadastroMusicaState extends State<CadastroMusica> {
  int _currentStep = 0;

  final _formKeyStep1 = GlobalKey<FormState>();
  final _formKeyStep2 = GlobalKey<FormState>();

  late final TextEditingController _nomeMusicaController;
  late final TextEditingController _linkYoutubeController;
  late final TextEditingController _partNameController;

  bool get isEditing => widget.musica != null;

  @override
  void initState() {
    super.initState();
    _nomeMusicaController = TextEditingController();
    _linkYoutubeController = TextEditingController();
    _partNameController = TextEditingController();
  }

  @override
  void dispose() {
    _nomeMusicaController.dispose();
    _linkYoutubeController.dispose();
    _partNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultPageScaffold(
      title: isEditing
          ? AppLocalizations.of(context)!.editSong
          : AppLocalizations.of(context)!.newSong,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: DefaultCardContainer(
                child: Column(
                  children: [
                    Text(_getCurrentStepText(),
                        style: const TextStyle(fontStyle: FontStyle.italic)),
                    Text(_getCurrentStepTitle(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26)),
                    Text(
                      _getCurrentStepDesc(),
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
                  _buildStepDadosMusica(),
                  _buildStepPartesMusica(),
                ],
                currentStep: _currentStep,
                onStepTapped: _onStepTapped,
                onStepContinue: _onStepContinue,
                onStepCancel: _onStepCancel),
          ],
        ),
      ),
    );
  }

  void _onStepTapped(int step) {
    if (step < _currentStep || _validateCanGoToTappedForm(step)) {
      setState(() => _currentStep = step);
    }
  }

  void _onStepContinue() {
    if (_currentStep == 0) {
      if (_formKeyStep1.currentState!.validate()) {
        setState(() => _currentStep += 1);
      }
    } else {
      _salvarMusica();
    }
  }

  void _onStepCancel() {
    if (_currentStep > 0) {
      setState(() => _currentStep -= 1);
    }
  }

  String _getCurrentStepTitle() {
    switch (_currentStep) {
      case 0:
        return AppLocalizations.of(context)!.step1Title;
      case 1:
        return AppLocalizations.of(context)!.step2Title;
      default:
        return "";
    }
  }

  String _getCurrentStepDesc() {
    switch (_currentStep) {
      case 0:
        return AppLocalizations.of(context)!.step1Desc;
      case 1:
        return AppLocalizations.of(context)!.step2Desc;
      default:
        return "";
    }
  }

  bool _validateCanGoToTappedForm(int step) {
    switch (step) {
      case 1:
        return _formKeyStep1.currentState!.validate();
      default:
        return true;
    }
  }

  String _getCurrentStepText() {
    return "${AppLocalizations.of(context)!.step} ${_currentStep + 1}";
  }

  Step _buildStepDadosMusica() => buildStep(
      title: AppLocalizations.of(context)!.step1Title,
      content: Form(
        key: _formKeyStep1,
        child: Column(
          children: [
            DefaultTextFormField(
                label: AppLocalizations.of(context)!.songName,
                hintText: AppLocalizations.of(context)!.hintSongName,
                controller: _nomeMusicaController,
                required: true),
            const SizedBox(height: 8.0),
            DefaultTextFormField(
                label: AppLocalizations.of(context)!.linkYoutube,
                hintText: AppLocalizations.of(context)!.hintSongUrl,
                helpText: AppLocalizations.of(context)!.helpYoutube,
                controller: _linkYoutubeController),
          ],
        ),
      ),
      stepIndex: 0,
      currentStep: _currentStep);

  Step _buildStepPartesMusica() => buildStep(
      title: AppLocalizations.of(context)!.step2Title,
      content: Form(
        key: _formKeyStep2,
        child: Column(
          children: [
            DefaultTextFormField(
                label: AppLocalizations.of(context)!.partName,
                hintText: AppLocalizations.of(context)!.hintSongPart,
                required: true,
                controller: _partNameController),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
      stepIndex: 1,
      currentStep: _currentStep);

  void _salvarMusica() {
    final isStep1Valid = _formKeyStep1.currentState!.validate();
    final isStep2Valid = _formKeyStep2.currentState!.validate();

    if (isStep1Valid && isStep2Valid) {
      displaySuccessToast(AppLocalizations.of(context)!.sucessoToast,
          AppLocalizations.of(context)!.sucessoCadastrarMsg);
      context.goBack();
    } else {
      displayErrorToast(AppLocalizations.of(context)!.errorToast,
          AppLocalizations.of(context)!.erroCadastrarMsg);
    }
  }
}
