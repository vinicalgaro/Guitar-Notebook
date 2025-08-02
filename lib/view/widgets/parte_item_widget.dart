import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guitar_learner/widgets/default_card_container.dart';

import '../../widgets/default_textbutton.dart';
import '../../widgets/default_textformfield.dart';

class ParteItemWidget extends StatelessWidget {
  final TextEditingController partNameController;
  final int index;

  const ParteItemWidget(
      {super.key, required this.partNameController, required this.index});

  @override
  Widget build(BuildContext context) {
    return DefaultCardContainer(
      shadow: false,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${AppLocalizations.of(context)!.part} $index"),
                if (index != 1)
                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
              ],
            ),
            DefaultTextFormField(
                label: AppLocalizations.of(context)!.partName,
                hintText: AppLocalizations.of(context)!.hintSongPart,
                required: true,
                controller: partNameController),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.ritmo,
                          style: const TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.sequencia,
                          style: const TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
