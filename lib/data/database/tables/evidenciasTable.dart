import 'package:drift/drift.dart';
import 'package:monitoramento/app/shared/enums/enumFiscalizacao.dart';
import 'package:monitoramento/app/shared/enums/enumStatusMode.dart';
import 'package:monitoramento/app/shared/enums/enumSharedMode.dart';

// <- essencial

class Evidenciastable extends Table {

  IntColumn get idEvi => integer().autoIncrement()();

  IntColumn get idRota => integer()();

  IntColumn get idFiscal => integer()();

  IntColumn get tema =>
      intEnum<TipoConstatacao>().withDefault(const Constant(0))();

  TextColumn get identificacao => text().nullable()();

  TextColumn get alimentador => text().nullable()();

  TextColumn get descricao => text()();

  TextColumn get image => text()();

  TextColumn get endereco => text()();

  RealColumn get lat => real()();

  RealColumn get long => real()();

  DateTimeColumn get horario =>
      dateTime().withDefault(currentDateAndTime)();

  IntColumn get status =>
      intEnum<StatusMode>().withDefault(const Constant(0))();

  IntColumn get action =>
      intEnum<SharedMode>().withDefault(const Constant(0))();
}