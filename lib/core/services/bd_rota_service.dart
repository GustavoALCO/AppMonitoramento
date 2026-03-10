import 'package:drift/drift.dart';
import 'package:monitoramento/data/database/app_database.dart';

class BdRotaService {

  final database = AppDatabase.instance;

  Future<void> criarRotas(int idRota,String alimentador, String dataInicio, String nomeRota) async{
    await database
        .into(database.rotastable)
        .insert(
          RotastableCompanion(
            idRota: Value(idRota),
            alimentador: Value(alimentador),
            dataInicio: Value(dataInicio),
            nomeRota: Value(nomeRota),
            
          ),
        );
  }

  Future<void> excluirTodasRotas() async {
    (database.delete(
      database.rotastable,
    )).go();
  }
}