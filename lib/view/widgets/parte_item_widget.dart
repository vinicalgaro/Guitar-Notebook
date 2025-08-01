import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widgets/default_textbutton.dart';
import '../../widgets/default_textformfield.dart';

class ParteItemWidget extends StatelessWidget {
  final TextEditingController partNameController;
  final int index;

  const ParteItemWidget(
      {super.key, required this.partNameController, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${AppLocalizations.of(context)!.part} $index"),
            IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
          ],
        ),
        DefaultTextFormField(
            label: AppLocalizations.of(context)!.partName,
            hintText: AppLocalizations.of(context)!.hintSongPart,
            required: true,
            controller: partNameController),
        const SizedBox(height: 8.0),
        DefaultTextButton(
          onPressed: () {},
          expandText: true,
          showBorder: true,
          child: Text(
            AppLocalizations.of(context)!.addParte,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
