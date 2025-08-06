import 'package:flutter/material.dart';
import 'package:guitar_learner/extensions/navigation_extension.dart';
import 'package:guitar_learner/model/repository/musica_repository.dart';
import 'package:guitar_learner/routes/app_routes.dart';
import 'package:guitar_learner/view/widgets/lista_musicas_widget.dart';
import 'package:guitar_learner/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _addMusic(BuildContext context) {
    context.goTo(AppRoutes.addSong);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(
        repository: context.read<IMusicaRepository>(),
      ),
      child: Scaffold(
        body: Consumer<HomeViewModel>(
          builder: (context, viewModel, child) =>
              ListaMusicasWidget(viewModel: viewModel),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addMusic(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
