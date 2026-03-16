import 'package:drift/drift.dart';
import 'package:monitoramento/app/shared/enums/enumFiscalizacao.dart';
import 'package:monitoramento/app/shared/enums/enumStatusMode.dart';
import 'package:monitoramento/app/shared/enums/enumsharedMode.dart';
import 'package:monitoramento/data/database/app_database.dart';

class BdEvidenciasService {
  final database = AppDatabase.instance;

  Future<void> excluirTodasEvidencias() async {
    await (database.delete(
      database.evidenciastable,
    )..where((tbl) => tbl.idEvi.isBiggerOrEqualValue(1))).go();
  }

  Future<void> alterarStatus(int id, StatusMode statusRecibe) async {
    await (database.update(database.evidenciastable)
          ..where((tbl) => tbl.idEvi.equals(id)))
        .write(EvidenciastableCompanion(status: Value(statusRecibe)));
  }

  Future<void> alterarEvidencia(
    int id,
    String? dsc,
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

        endereco: endereco != null ? Value(endereco) : const Value.absent(),

        identificacao: identificacao != null
            ? Value(identificacao)
            : const Value.absent(),

        alimentador: alimentador != null
            ? Value(alimentador)
            : const Value.absent(),

        status: const Value(StatusMode.local),
        action: const Value(SharedMode.update),
      ),
    );
  }

 Future<void> criarEvidencia(
  int idRota,
  int idFiscal,
  String image,
  double lat,
  double long,
  String endereco,
  String descricao,
  String alimentador,
  String identificacao,
  TipoConstatacao tema
) async {

 try {
  await database.into(database.evidenciastable).insert(
    EvidenciastableCompanion(
      idRota: Value(idRota), // ou trate como obrigatório
      idFiscal: Value(idFiscal),
      horario: Value(DateTime.now()),
      image: Value(image), // certifique-se que a coluna é nullable se image for null
      lat: Value(lat ),
      long: Value(long),
      endereco: Value(endereco),
      descricao: Value(descricao),
      status: Value(StatusMode.local), // converte enum para string
      action: Value(SharedMode.create), // converte enum para string
      alimentador: Value(alimentador),
      identificacao: Value(identificacao),
      tema: Value(tema),
    ),
  );

  await database.select(database.evidenciastable).get();


// ignore: empty_catches
} catch (ex) {

}
}

  Future<List<EvidenciastableData>> buscarEvidenciasID(int idRota) async {
  final evidencias = await (database.select(
    database.evidenciastable,
  )..where((tbl) => tbl.idRota.equals(idRota))).get();

  return evidencias;
}

  Future<List<EvidenciastableData>> buscarEvidencias() async {
    final evidencias = await (database.select(database.evidenciastable).get());

    return evidencias;
  }

  Future<List<EvidenciastableData>> buscarEvidenciasPagina(
    int idRota,
    int page,
    int pageSize,
  ) async {
    final offset = (page - 1) * pageSize;

    final envidencias =
        await (database.select(database.evidenciastable)
              ..where((x) => x.idRota.equals(idRota))
              ..limit(pageSize, offset: offset))
            .get();

    return envidencias;
  }

  Future<void> excluirEvidencia(int idEvi) async {
    await (database.delete(
      database.evidenciastable,
    )..where((tbl) => tbl.idEvi.equals(idEvi))).go();
  }
}
