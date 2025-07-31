import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guitar_learner/helpers/get_from_assets.dart';
import 'package:lottie/lottie.dart';

import '../theme/app_theme.dart';

class DefaultStepper extends StatelessWidget {
  final List<Step> steps;
  final int currentStep;
  final VoidCallback onStepContinue;
  final VoidCallback onStepCancel;
  final ValueChanged<int> onStepTapped;

  const DefaultStepper(
      {super.key,
      required this.steps,
      required this.currentStep,
      required this.onStepContinue,
      required this.onStepTapped,
      required this.onStepCancel});

  @override
  Widget build(BuildContext context) {
    return Stepper(
      steps: steps,
      currentStep: currentStep,
      onStepContinue: onStepContinue,
      onStepCancel: onStepCancel,
      onStepTapped: onStepTapped,
      stepIconBuilder: (stepIndex, stepState) {
        switch (stepState) {
          case StepState.complete:
            return const Icon(Icons.check_circle, color: AppTheme.paletaGreen);
          case StepState.editing:
            return Lottie.asset(getAnimationFromAssets("Loading.json"));
          default:
            return CircleAvatar(
              child: Text('${stepIndex + 1}',
                  style: const TextStyle(color: Colors.white)),
            );
        }
      },
      controlsBuilder: (context, details) {
        final isLastStep = currentStep == steps.length - 1;
        return Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: details.onStepContinue,
                child: Text(isLastStep
                    ? AppLocalizations.of(context)!.salvar
                    : AppLocalizations.of(context)!.continuar),
              ),
              const SizedBox(width: 12),
              if (currentStep > 0)
                TextButton(
                  onPressed: details.onStepCancel,
                  child: Text(AppLocalizations.of(context)!.voltar),
                ),
            ],
          ),
        );
      },
    );
  }
}
