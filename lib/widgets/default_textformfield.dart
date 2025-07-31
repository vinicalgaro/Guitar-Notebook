import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DefaultTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  bool required;

  DefaultTextFormField(
      {super.key,
      required this.label,
      required this.controller,
      this.required = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$label ${required ? "*" : ""}",
            style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          decoration: const InputDecoration(border: OutlineInputBorder()),
          validator: (value) {
            if (!required) {
              return null;
            } else if (value == null || value.isEmpty) {
              return AppLocalizations.of(context)!.fieldRequired;
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
