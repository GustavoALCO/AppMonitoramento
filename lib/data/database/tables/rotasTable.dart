import 'package:drift/drift.dart';
import 'package:monitoramento/app/shared/enums/enumConc.dart';

class Rotastable extends Table
{
  TextColumn get idRota => text()();

  TextColumn get nomeRota => text()();

  TextColumn get alimentador => text()();

  TextColumn get dataInicio => text()();

  IntColumn get conc =>
      intEnum<Conc>().withDefault(const Constant(0))();

  RealColumn get km => real().nullable()();

  @override
  Set<Column> get primaryKey => {idRota};
}