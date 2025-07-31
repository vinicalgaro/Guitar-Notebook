import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guitar_learner/helpers/helper_dialog.dart';

class DefaultTextFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool required;
  final String? Function(String)? validator;
  final String? helpText;

  const DefaultTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.required = false,
    this.validator,
    this.helpText,
  });

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
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hintText,
            suffixIcon: helpText == null
                ? null
                : IconButton(
                    icon: const Icon(Icons.help_outline),
                    onPressed: () => _exibirAjuda(context, helpText!),
                  ),
          ),
          validator: (value) {
            if (required && (value == null || value.isEmpty)) {
              return AppLocalizations.of(context)!.fieldRequired;
            } else if (validator != null &&
                (value != null && value.isNotEmpty)) {
              return validator!(value);
            }
            return null;
          },
        ),
      ],
    );
  }

  void _exibirAjuda(BuildContext context, String s) {
    displayActionDialog(context, AppLocalizations.of(context)!.help, s, null,
        onlyOneButton: true);
  }
}
