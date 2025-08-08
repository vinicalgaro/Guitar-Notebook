import 'package:flutter/material.dart';
import 'package:guitar_notebook/model/musica/models.dart' as model;
import 'package:guitar_notebook/view/widgets/musica_list_item_widget.dart';
import 'package:guitar_notebook/viewmodel/home_viewmodel.dart';
import '../../l10n/app_localizations.dart';

import '../../widgets/default_card_container.dart';

class ListaMusicasWidget extends StatelessWidget {
  final HomeViewModel viewModel;

  const ListaMusicasWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    const double horizontalMargin = 10.0;

    return StreamBuilder<List<model.Musica>>(
      stream: viewModel.musicasStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        String? warningText;
        if (snapshot.hasError) {
          warningText = localizations.errorLoadingMusics;
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          warningText = localizations.noMusics;
        }

        if (warningText != null) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: horizontalMargin),
            child: DefaultCardContainer(
                margin: EdgeInsets.zero,
                shadow: false,
                child: ListTile(
                  title: Text(warningText),
                  trailing: const Icon(Icons.mood_bad_outlined),
                )),
          );
        }

        final musicas = snapshot.data!;
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: horizontalMargin),
            child: ListView.builder(
              itemCount: musicas.length,
              itemBuilder: (context, index) {
                final musica = musicas[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: MusicaListItemWidget(
                      musica: musica,
                      deletarMusica: () => viewModel.deletarMusica(musica.id!)),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
