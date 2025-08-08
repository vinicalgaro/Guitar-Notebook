import 'package:flutter/material.dart';

import '../model/musica/musica.dart';
import '../widgets/default_page_scaffold_scrolless.dart';

class PlaySongPage extends StatelessWidget {
  final Musica musica;

  const PlaySongPage({super.key, required this.musica});

  @override
  Widget build(BuildContext context) {
    return DefaultPageScaffoldScrolless(
      title: musica.nome,
      body: Column(children: [
      
    ],),
    );
  }
}
