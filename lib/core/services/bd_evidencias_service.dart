import 'package:drift/drift.dart';
import 'package:monitoramento/data/database/app_database.dart';

class BdEvidenciasService {
  final database = AppDatabase.instance;

  Future<void> excluirTodasEvidencias() async {
    await (database.delete(
      database.evidenciastable,
    )..where((tbl) => tbl.idEvi.isBiggerOrEqualValue(1))).go();
  }

  Future<void> alterarEvidencia(
    int id,
    String? dsc,
    String? cep,
    String? endereco,
    String? identificacao,
    String? alimentador,
  ) async {
    await (database.update(
      database.evidenciastable,
    )..where((tbl) => tbl.idEvi.equals(id))).write(
      EvidenciastableCompanion(
        // só altera os valores se for passado diferente de null
        descricao: dsc != null ? Value(dsc) : const Value.absent(),

        cep: cep != null ? Value(cep) : const Value.absent(),
        endereco: endereco != null ? Value(endereco) : const Value.absent(),

        identificacao: identificacao != null
            ? Value(identificacao)
            : const Value.absent(),

        alimentador: alimentador != null
            ? Value(alimentador)
            : const Value.absent(),
      ),
    );
  }

  Future<void> criarEvidencia(
    int idRota,
    int idFiscal,
    String cep,
    String image,
    double lat,
    double long,
    String endereco,
    String descricao,
  ) async {
    await database
        .into(database.evidenciastable)
        .insert(
          EvidenciastableCompanion(
            idRota: Value(idRota),
            idFiscal: Value(idFiscal),
            cep: Value(cep),
            horario: Value(DateTime.now()),
            image: Value(image),
            lat: Value(lat),
            long: Value(long),
            endereco: Value(endereco),
            descricao: Value(descricao),
            status: const Value(false),
          ),
        );
  }

  Future<List<EvidenciastableData>> buscarEvidenciasID(int idRota) async {
    final evidencias = await (database.select(
      database.evidenciastable,
    )..where((tbl) => tbl.idRota.equals(idRota))).get();

    return evidencias;
  }

  Future<void> excluirEvidencia(int idEvi) async {
    await (database.delete(
      database.evidenciastable,
    )..where((tbl) => tbl.idEvi.equals(idEvi))).go();
  }
}
