import 'package:flutter/material.dart';
import 'package:flutter_guitar_chord/flutter_guitar_chord.dart';
import 'package:guitar_notebook/extensions/color_extension.dart';
import 'package:guitar_notebook/helpers/helper_acorde_formatter.dart';
import 'package:guitar_notebook/model/musica/models.dart';

class AcordeDiagramWidget extends StatelessWidget {
  final Acorde acorde;

  const AcordeDiagramWidget({super.key, required this.acorde});

  @override
  Widget build(BuildContext context) {
    final Posicoes posicao = acorde.posicoes;
    final String frets = HelperAcordeFormatter.formatListToString(
      posicao.frets,
      trasteInicial: posicao.trasteInicial,
    );
    final String fingers = HelperAcordeFormatter.formatListToString(
      posicao.fingers,
    );

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final chordDiagramColor = isDarkMode ? Colors.white : Colors.black;

    return SizedBox(
      height: 200,
      width: 150,
      child: FlutterGuitarChord(
        baseFret: posicao.trasteInicial,
        chordName: "${acorde.nome} / ${acorde.formattedName(context)}",
        fingers: fingers,
        frets: frets,
        totalString: acorde.cordas,
        tabBackgroundColor: Theme.of(context).colorScheme.primary.darken(0.3),
        tabForegroundColor: Theme.of(context).colorScheme.onPrimary,
        barColor: chordDiagramColor,
        stringColor: chordDiagramColor,
        firstFrameColor: chordDiagramColor,
        labelColor: chordDiagramColor,
        mutedColor: chordDiagramColor,
      ),
    );
  }
}
