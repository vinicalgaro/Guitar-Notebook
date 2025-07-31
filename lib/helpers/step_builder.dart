import 'package:flutter/material.dart';

Step buildStep({
  required String title,
  required Widget content,
  required int stepIndex,
  required int currentStep,
}) =>
    Step(
      title: Text(title),
      content: content,
      isActive: currentStep >= stepIndex,
      state: currentStep > stepIndex
          ? StepState.complete
          : currentStep == stepIndex
              ? StepState.editing
              : StepState.indexed,
    );
