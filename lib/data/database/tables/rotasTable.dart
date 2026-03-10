import 'package:drift/drift.dart';

class Rotastable extends Table
{
  IntColumn get idRota => integer()();

  TextColumn get nomeRota => text()();

  TextColumn get alimentador => text()();

  TextColumn get dataInicio => text()();

  @override
  Set<Column> get primaryKey => {idRota};
}