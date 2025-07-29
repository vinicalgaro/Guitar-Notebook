import 'package:flutter/material.dart';
import 'package:guitar_learner/view/home_drawer.dart';
import 'package:guitar_learner/view/lista_musicas.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  addMusic() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
      ),
      drawer: const HomeDrawer(),
      body: const ListaMusicas(),
      floatingActionButton: FloatingActionButton(
        onPressed: addMusic,
        child: const Icon(Icons.add),
      ),
    );
  }
}
