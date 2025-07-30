import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guitar_learner/widgets/default_page_scaffold.dart';

class CadastroMusica extends StatefulWidget {
  final Object? musica;

  const CadastroMusica({super.key, this.musica});

  @override
  State<CadastroMusica> createState() => _CadastroMusicaState();
}

class _CadastroMusicaState extends State<CadastroMusica> {
  int _currentStep = 1;

  final _formKeyStep1 = GlobalKey<FormState>();
  final _formKeyStep2 = GlobalKey<FormState>();

  bool get isEditing => widget.musica != null;

  @override
  Widget build(BuildContext context) {
    return DefaultPageScaffold(
      title: isEditing
          ? AppLocalizations.of(context)!.editSong
          : AppLocalizations.of(context)!.newSong,
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(_getCurrentStepText()),
                Text(_getCurrentStepTitle(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 26)),
                Text(
                  _getCurrentStepDesc(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ],
            ),
          ),
          Stepper(
            steps: [
              _buildStepDadosMusica(),
              _buildStepPartesMusica(),
            ],
          ),
        ],
      ),
    );
  }

  String _getCurrentStepTitle() {
    switch (_currentStep) {
      case 1:
        return AppLocalizations.of(context)!.step1Title;
      case 2:
        return AppLocalizations.of(context)!.step2Title;
      default:
        return "";
    }
  }

  String _getCurrentStepDesc() {
    switch (_currentStep) {
      case 1:
        return AppLocalizations.of(context)!.step1Desc;
      case 2:
        return AppLocalizations.of(context)!.step2Desc;
      default:
        return "";
    }
  }

  String _getCurrentStepText() {
    return "${AppLocalizations.of(context)!.step} $_currentStep";
  }

  Step _buildStepDadosMusica() => Step(
        title: Text(AppLocalizations.of(context)!.step1Title),
        content: Container(),
      );

  Step _buildStepPartesMusica() => Step(
        title: Text(AppLocalizations.of(context)!.step2Title),
        content: Container(),
      );
}
