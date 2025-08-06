import 'package:flutter/material.dart';
import 'package:guitar_learner/model/musica/models.dart' as model;
import 'package:guitar_learner/viewmodel/home_viewmodel.dart';

class ListaMusicasWidget extends StatelessWidget {
  final HomeViewModel viewModel;

  const ListaMusicasWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<model.Musica>>(
      stream: viewModel.musicasStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
              child: Text('Erro ao carregar músicas: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              'Nenhuma música cadastrada ainda.\nClique em "+" para começar!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          );
        }

        final musicas = snapshot.data!;
        return ListView.builder(
          itemCount: musicas.length,
          itemBuilder: (context, index) {
            final musica = musicas[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.music_note_rounded),
                title: Text(musica.nome,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(musica.instrumento.nameFormatted(context)),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // TODO: Implementar navegação para a tela de tocar a música
                },
              ),
            );
          },
        );
      },
    );
  }
}
