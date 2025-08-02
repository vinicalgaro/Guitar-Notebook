import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guitar_learner/extensions/navigation_extension.dart';
import 'package:guitar_learner/routes/app_routes.dart';
import 'package:guitar_learner/view/widgets/home_drawer_widget.dart';
import 'package:guitar_learner/view/widgets/lista_musicas_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  addMusic(BuildContext context) {
    context.goTo(AppRoutes.addSong);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
      ),
      drawer: const HomeDrawerWidget(),
      body: const ListaMusicasWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addMusic(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
