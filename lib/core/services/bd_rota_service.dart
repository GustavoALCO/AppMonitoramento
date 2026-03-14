import 'package:drift/drift.dart';
import 'package:monitoramento/data/database/app_database.dart';

class BdRotaService {
  final database = AppDatabase.instance;

  Future<void> criarRotas(
    int idRota,
    String alimentador,
    String dataInicio,
    String nomeRota,
  ) async {
    await database
        .into(database.rotastable)
        .insert(
          RotastableCompanion(
            idRota: Value(idRota),
            alimentador: Value(alimentador),
            dataInicio: Value(dataInicio),
            nomeRota: Value(nomeRota),
          ),
        );
  }

  Future<void> excluirTodasRotas() async {
    (database.delete(database.rotastable)).go();
  }

  Future<bool> existeRotas() async {
    final rotas = await database.select(database.rotastable).get();

    return rotas.isNotEmpty;
  }

  //busca com paginação
  Future<List<RotastableData>> buscarRotas(int page, int pageSize) async {

  final offset = (page - 1) * pageSize;

  final rotas = await (database.select(database.rotastable)
        ..limit(pageSize, offset: offset))
      .get();

  return rotas;
}
}
