import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import 'package:guitar_notebook/helpers/get_from_assets.dart';
import 'package:lottie/lottie.dart';

import 'default_textbutton.dart';

class DefaultStepper extends StatelessWidget {
  final List<Step> steps;
  final int currentStep;
  final VoidCallback onStepContinue;
  final VoidCallback onStepCancel;
  final ValueChanged<int> onStepTapped;

  const DefaultStepper({
    super.key,
    required this.steps,
    required this.currentStep,
    required this.onStepContinue,
    required this.onStepTapped,
    required this.onStepCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Stepper(
      steps: steps,
      currentStep: currentStep,
      onStepContinue: onStepContinue,
      onStepCancel: onStepCancel,
      controller: ScrollController(),
      onStepTapped: onStepTapped,
      stepIconBuilder: (stepIndex, stepState) {
        switch (stepState) {
          case StepState.complete:
            return const Icon(Icons.check_circle, color: Colors.green);
          case StepState.editing:
            return Transform.scale(
              scale: 1.7,
              child: Lottie.asset(getAnimationFromAssets("Loading.json")),
            );
          default:
            return CircleAvatar(
              backgroundColor: Theme.of(context).disabledColor,
              child: Text(
                '${stepIndex + 1}',
                style: const TextStyle(color: Colors.white),
              ),
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
                child: Text(
                  isLastStep
                      ? AppLocalizations.of(context)!.salvar
                      : AppLocalizations.of(context)!.continuar,
                ),
              ),
              const SizedBox(width: 12),
              if (currentStep > 0)
                DefaultTextButton(
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
