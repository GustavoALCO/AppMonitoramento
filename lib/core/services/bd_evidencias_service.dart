import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:monitoramento/app/shared/enums/enumFiscalizacao.dart';
import 'package:monitoramento/app/shared/enums/enumStatusMode.dart';
import 'package:monitoramento/app/shared/enums/enumsharedMode.dart';
import 'package:monitoramento/data/database/app_database.dart';
import 'package:uuid/uuid.dart';

class BdEvidenciasService {
  final database = AppDatabase.instance;
  final uuid = Uuid();

  List<String> converterImagens(String jsonImages) {
    final List<dynamic> decoded = jsonDecode(jsonImages);
    return decoded.cast<String>();
  }

  Future<void> excluirTodasEvidencias() async {
    (database.delete(database.evidenciastable)..go());
  }

  Future<void> alterarStatus(String id, StatusMode statusRecibe) async {
    await (database.update(database.evidenciastable)
          ..where((tbl) => tbl.evidenciaId.equals(id)))
        .write(EvidenciastableCompanion(status: Value(statusRecibe)));
  }

  Future<void> alterarEvidencia(
    StatusMode statusRecibe,
    String idrota,
    String idevidencia,
    String? dsc,
    String? endereco,
    String? identificacao,
    String? alimentador,
    bool? emergencial,
  ) async {
    if (statusRecibe == StatusMode.local) {
      await (database.update(
        database.evidenciastable,
      )..where((tbl) => tbl.evidenciaId.equals(idevidencia))).write(
        EvidenciastableCompanion(
          descricao: dsc != null ? Value(dsc) : const Value.absent(),
          endereco: endereco != null ? Value(endereco) : const Value.absent(),
          identificacao: identificacao != null
              ? Value(identificacao)
              : const Value.absent(),
          alimentador: alimentador != null
              ? Value(alimentador)
              : const Value.absent(),
          status: const Value(StatusMode.local),
          action: const Value(SharedMode.create),
          emergencial: emergencial != null
              ? Value(emergencial)
              : const Value.absent(),
        ),
      );
    } else {
      var evidencia = await buscarEvidenciaPorIdEvi(idevidencia);

      if (evidencia != null) {
        await (database.update(
          database.evidenciastable,
        )..where((tbl) => tbl.evidenciaId.equals(idevidencia))).write(
          EvidenciastableCompanion(
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
            emergencial: emergencial != null
                ? Value(emergencial)
                : const Value.absent(),
          ),
        );
      } else {
        await database
            .into(database.evidenciastable)
            .insert(
              EvidenciastableCompanion.insert(
                evidenciaId: idevidencia,
                idRota: idrota,
                descricao: Value(dsc),
                endereco: Value(endereco),
                identificacao: Value(identificacao),
                alimentador: Value(alimentador),
                status: const Value(StatusMode.local),
                action: const Value(SharedMode.update),
              ),
            );
      }
    }
  }

  Future<void> criarEvidencia(
    String idRota,
    int idFiscal,
    List<String> images,
    double lat,
    double long,
    String endereco,
    String cidade,
    String descricao,
    String alimentador,
    String identificacao,
    TipoConstatacao tema,
    bool emergencial,
  ) async {
    final imagesJson = jsonEncode(images);

    try {
      await database
          .into(database.evidenciastable)
          .insert(
            EvidenciastableCompanion(
              evidenciaId: Value(uuid.v4()),
              idRota: Value(idRota),
              idFiscal: Value(idFiscal),
              horario: Value(DateTime.now()),
              image: Value(imagesJson),
              lat: Value(lat),
              long: Value(long),
              endereco: Value(endereco),
              cidade: Value(cidade),
              descricao: Value(descricao),
              status: Value(StatusMode.local),
              action: Value(SharedMode.create),
              alimentador: Value(alimentador),
              identificacao: Value(identificacao),
              tema: Value(tema),
              emergencial: Value(emergencial),
            ),
          );

      await database.select(database.evidenciastable).get();

      // ignore: empty_catches
    } catch (ex) {}
  }

  Future<List<EvidenciastableData>> buscarEvidenciasIDRota(
    String idRota,
  ) async {
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
    String idRota,
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

  Future<void> excluirEvidencia(String idEvi) async {
    await (database.delete(
      database.evidenciastable,
    )..where((tbl) => tbl.evidenciaId.equals(idEvi))).go();
  }

  Future<EvidenciastableData?> buscarEvidenciaPorIdEvi(String idEvi) async {
    final evidencia = await (database.select(
      database.evidenciastable,
    )..where((tbl) => tbl.evidenciaId.equals(idEvi))).getSingleOrNull();

    return evidencia;
  }
}
