import 'package:flutter/material.dart';
import 'package:guitar_notebook/helpers/helper_toast.dart';
import 'package:guitar_notebook/viewmodel/play_song_viewmodel.dart';

import '../../l10n/app_localizations.dart';

class SliderAutoplayerWidget extends StatefulWidget {
  final VoidCallback onChanged;
  final PlaySongViewModel viewModel;

  const SliderAutoplayerWidget({
    super.key,
    required this.viewModel,
    required this.onChanged,
  });

  @override
  State<SliderAutoplayerWidget> createState() => _SliderAutoplayerWidgetState();
}

class _SliderAutoplayerWidgetState extends State<SliderAutoplayerWidget> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final viewModel = widget.viewModel;
    double autoplaySegundos = viewModel.autoPlaySeconds;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              localizations.autoplayer,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              _label(autoplaySegundos, localizations),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        Slider(
          value: autoplaySegundos,
          min: viewModel.minAutoPlaySeconds,
          max: viewModel.maxAutoPlaySeconds,
          divisions: viewModel.autoPlayDivisions,
          label: _label(autoplaySegundos, localizations),
          onChangeEnd: (v) => _onChangeEnd(v, localizations),
          onChanged: (double novoValor) {
            viewModel.setAutoPlaySeconds(novoValor);
            setState(() {});
          },
        ),
      ],
    );
  }

  String _label(double autoplaySegundos, AppLocalizations localizations) =>
      autoplaySegundos == 0
      ? localizations.desabilitado
      : '${autoplaySegundos.round()} s';

  _onChangeEnd(double value, AppLocalizations localizations) {
    if (value > 0) {
      displayInfoToast(localizations.autoplayer, localizations.autoplayerDesc);
    }
    widget.onChanged();
  }
}
