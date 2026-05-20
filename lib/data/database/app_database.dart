  import 'dart:io';

  import 'package:drift/drift.dart';
  import 'package:drift/native.dart';
  import 'package:monitoramento/app/shared/enums/enumConc.dart';
  import 'package:monitoramento/app/shared/enums/enumStatusMode.dart';
  import 'package:monitoramento/app/shared/enums/enumSharedMode.dart';
  import 'package:monitoramento/data/database/tables/evidenciasTable.dart';
  import 'package:monitoramento/data/database/tables/rotasTable.dart';

  import 'package:path/path.dart' as p;
  import 'package:path_provider/path_provider.dart';

  part 'app_database.g.dart'; // IMPORTANTE: não mude este path

  @DriftDatabase(
    tables: [Evidenciastable, Rotastable],
  )

  class AppDatabase extends _$AppDatabase {
    // Construtor privado
    AppDatabase._internal() : super(_openConnection());

    // Instância única
    static final AppDatabase instance = AppDatabase._internal();

    @override
    int get schemaVersion => 1;
  }

  // Conexão com o SQLite
  LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'monitoramento.sqlite'));
      return NativeDatabase(file);
    });
  }