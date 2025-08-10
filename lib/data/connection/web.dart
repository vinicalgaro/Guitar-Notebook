import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';

LazyDatabase openConnection() {
  return LazyDatabase(() async {
    final result = await WasmDatabase.open(
      databaseName: 'guitar_notebook_db',
      sqlite3Uri: Uri.parse('sqlite3.wasm'),
      driftWorkerUri: Uri.parse('drift_worker.js'),
    );

    if (result.missingFeatures.isNotEmpty) {
      print('Funcionalidades em falta no navegador: ${result.missingFeatures}');
    }

    print('--- CONEXÃO COM O BANCO DE DADOS WEB ESTABELECIDA COM SUCESSO ---');
    return result.resolvedExecutor;
  });
}
