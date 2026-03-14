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

        status: const Value(StatusMode.local),
        action: const Value(SharedMode.update),
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
  String alimentador,
  String identificacao,
  TipoConstatacao tema
) async {

  try {

    final id = await database
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
            status: Value(StatusMode.local),
            action: Value(SharedMode.create),
            alimentador: Value(alimentador),
            identificacao: Value(identificacao),
            tema: Value(tema),
          ),
        );

    print("Evidencia inserida ID: $id");

    final lista = await database.select(database.evidenciastable).get();

    print("TOTAL NO BANCO: ${lista.length}");

  } catch(ex, d) {
    print("Erro ao adicionar evidencia ao Banco de dados. $ex");
    print(d);
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
