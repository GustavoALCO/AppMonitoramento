import 'package:drift/drift.dart';

//Definindo classes de evidencia para o armazenamento local.
class Evidenciastable extends Table
{
  IntColumn get idEvi => integer().autoIncrement()();

  IntColumn get idRota => integer()();

  IntColumn get idFiscal => integer()(); 

  TextColumn get identificacao => text().nullable()();

  TextColumn get alimentador => text().nullable()();

  TextColumn get descricao => text()();

  TextColumn get image => text()();

  TextColumn get endereco => text()();

  TextColumn get cep => text()();

  RealColumn get lat => real()();

  RealColumn get long => real()();

  DateTimeColumn get horario => dateTime().withDefault(currentDateAndTime)();

  //Coluna para Verificar se evidencia já foi enviada
  BoolColumn get status => boolean().withDefault(const Constant(false))();

}