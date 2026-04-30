import 'package:drift/drift.dart';
import 'package:monitoramento/app/shared/enums/enumConc.dart';
import 'package:monitoramento/data/database/app_database.dart';
import 'package:uuid/uuid.dart';

class BdRotaService {
  final database = AppDatabase.instance;
  final uuid = Uuid();
  
  Future<void> adicionarRota(
    String idRota,
    String alimentador,
    String dataInicio,
    String nomeRota,
    Conc conc,
    double? km
  ) async {
    await database
        .into(database.rotastable)
        .insert(
          RotastableCompanion(
            idRota: Value(idRota),
            alimentador: Value(alimentador),
            dataInicio: Value(dataInicio),
            nomeRota: Value(nomeRota),
            conc: Value(conc),
            km: Value(km)
          ),
        );
  }

  Future<void> criarRotas(
    String alimentador,
    String dataInicio,
    String nomeRota,
    Conc conc,
  ) async {
    await database
        .into(database.rotastable)
        .insert(
          RotastableCompanion(
            idRota: Value(uuid.v4()),
            alimentador: Value(alimentador),
            dataInicio: Value(dataInicio),
            nomeRota: Value(nomeRota),
            conc: Value(conc)
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
