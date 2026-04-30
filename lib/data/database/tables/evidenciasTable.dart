import 'package:drift/drift.dart';
import 'package:monitoramento/app/shared/enums/enumFiscalizacao.dart';
import 'package:monitoramento/app/shared/enums/enumStatusMode.dart';
import 'package:monitoramento/app/shared/enums/enumSharedMode.dart';

class Evidenciastable extends Table {
  TextColumn get evidenciaId => text()();

  TextColumn get idRota => text()();

  IntColumn get idFiscal => integer().nullable()();

  IntColumn get tema =>
      intEnum<TipoConstatacao>().nullable().withDefault(const Constant(0))();

  TextColumn get identificacao => text().nullable()();

  TextColumn get alimentador => text().nullable()();

  TextColumn get descricao => text().nullable()();

  TextColumn get image => text().nullable()();

  TextColumn get endereco => text().nullable()();

  TextColumn get cidade => text().nullable()();

  RealColumn get lat => real().nullable()();

  RealColumn get long => real().nullable()();

  DateTimeColumn get horario => dateTime().nullable().withDefault(currentDateAndTime)();

  BoolColumn get emergencial => boolean().withDefault(const Constant(false))();

  // Variaveis para controle de status e ações
  IntColumn get status =>
      intEnum<StatusMode>().withDefault(const Constant(0))();

  IntColumn get action =>
      intEnum<SharedMode>().withDefault(const Constant(0))();

  
}
