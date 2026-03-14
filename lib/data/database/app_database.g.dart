// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $EvidenciastableTable extends Evidenciastable
    with TableInfo<$EvidenciastableTable, EvidenciastableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EvidenciastableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idEviMeta = const VerificationMeta('idEvi');
  @override
  late final GeneratedColumn<int> idEvi = GeneratedColumn<int>(
    'id_evi',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idRotaMeta = const VerificationMeta('idRota');
  @override
  late final GeneratedColumn<int> idRota = GeneratedColumn<int>(
    'id_rota',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idFiscalMeta = const VerificationMeta(
    'idFiscal',
  );
  @override
  late final GeneratedColumn<int> idFiscal = GeneratedColumn<int>(
    'id_fiscal',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<TipoConstatacao, int> tema =
      GeneratedColumn<int>(
        'tema',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      ).withConverter<TipoConstatacao>($EvidenciastableTable.$convertertema);
  static const VerificationMeta _identificacaoMeta = const VerificationMeta(
    'identificacao',
  );
  @override
  late final GeneratedColumn<String> identificacao = GeneratedColumn<String>(
    'identificacao',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _alimentadorMeta = const VerificationMeta(
    'alimentador',
  );
  @override
  late final GeneratedColumn<String> alimentador = GeneratedColumn<String>(
    'alimentador',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descricaoMeta = const VerificationMeta(
    'descricao',
  );
  @override
  late final GeneratedColumn<String> descricao = GeneratedColumn<String>(
    'descricao',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enderecoMeta = const VerificationMeta(
    'endereco',
  );
  @override
  late final GeneratedColumn<String> endereco = GeneratedColumn<String>(
    'endereco',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cepMeta = const VerificationMeta('cep');
  @override
  late final GeneratedColumn<String> cep = GeneratedColumn<String>(
    'cep',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longMeta = const VerificationMeta('long');
  @override
  late final GeneratedColumn<double> long = GeneratedColumn<double>(
    'long',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _horarioMeta = const VerificationMeta(
    'horario',
  );
  @override
  late final GeneratedColumn<DateTime> horario = GeneratedColumn<DateTime>(
    'horario',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  late final GeneratedColumnWithTypeConverter<StatusMode, int> status =
      GeneratedColumn<int>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      ).withConverter<StatusMode>($EvidenciastableTable.$converterstatus);
  @override
  late final GeneratedColumnWithTypeConverter<SharedMode, int> action =
      GeneratedColumn<int>(
        'action',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      ).withConverter<SharedMode>($EvidenciastableTable.$converteraction);
  @override
  List<GeneratedColumn> get $columns => [
    idEvi,
    idRota,
    idFiscal,
    tema,
    identificacao,
    alimentador,
    descricao,
    image,
    endereco,
    cep,
    lat,
    long,
    horario,
    status,
    action,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'evidenciastable';
  @override
  VerificationContext validateIntegrity(
    Insertable<EvidenciastableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_evi')) {
      context.handle(
        _idEviMeta,
        idEvi.isAcceptableOrUnknown(data['id_evi']!, _idEviMeta),
      );
    }
    if (data.containsKey('id_rota')) {
      context.handle(
        _idRotaMeta,
        idRota.isAcceptableOrUnknown(data['id_rota']!, _idRotaMeta),
      );
    } else if (isInserting) {
      context.missing(_idRotaMeta);
    }
    if (data.containsKey('id_fiscal')) {
      context.handle(
        _idFiscalMeta,
        idFiscal.isAcceptableOrUnknown(data['id_fiscal']!, _idFiscalMeta),
      );
    } else if (isInserting) {
      context.missing(_idFiscalMeta);
    }
    if (data.containsKey('identificacao')) {
      context.handle(
        _identificacaoMeta,
        identificacao.isAcceptableOrUnknown(
          data['identificacao']!,
          _identificacaoMeta,
        ),
      );
    }
    if (data.containsKey('alimentador')) {
      context.handle(
        _alimentadorMeta,
        alimentador.isAcceptableOrUnknown(
          data['alimentador']!,
          _alimentadorMeta,
        ),
      );
    }
    if (data.containsKey('descricao')) {
      context.handle(
        _descricaoMeta,
        descricao.isAcceptableOrUnknown(data['descricao']!, _descricaoMeta),
      );
    } else if (isInserting) {
      context.missing(_descricaoMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('endereco')) {
      context.handle(
        _enderecoMeta,
        endereco.isAcceptableOrUnknown(data['endereco']!, _enderecoMeta),
      );
    } else if (isInserting) {
      context.missing(_enderecoMeta);
    }
    if (data.containsKey('cep')) {
      context.handle(
        _cepMeta,
        cep.isAcceptableOrUnknown(data['cep']!, _cepMeta),
      );
    } else if (isInserting) {
      context.missing(_cepMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('long')) {
      context.handle(
        _longMeta,
        long.isAcceptableOrUnknown(data['long']!, _longMeta),
      );
    } else if (isInserting) {
      context.missing(_longMeta);
    }
    if (data.containsKey('horario')) {
      context.handle(
        _horarioMeta,
        horario.isAcceptableOrUnknown(data['horario']!, _horarioMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idEvi};
  @override
  EvidenciastableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EvidenciastableData(
      idEvi: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_evi'],
      )!,
      idRota: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_rota'],
      )!,
      idFiscal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_fiscal'],
      )!,
      tema: $EvidenciastableTable.$convertertema.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}tema'],
        )!,
      ),
      identificacao: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}identificacao'],
      ),
      alimentador: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alimentador'],
      ),
      descricao: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descricao'],
      )!,
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      )!,
      endereco: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}endereco'],
      )!,
      cep: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cep'],
      )!,
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      )!,
      long: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}long'],
      )!,
      horario: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}horario'],
      )!,
      status: $EvidenciastableTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}status'],
        )!,
      ),
      action: $EvidenciastableTable.$converteraction.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}action'],
        )!,
      ),
    );
  }

  @override
  $EvidenciastableTable createAlias(String alias) {
    return $EvidenciastableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TipoConstatacao, int, int> $convertertema =
      const EnumIndexConverter<TipoConstatacao>(TipoConstatacao.values);
  static JsonTypeConverter2<StatusMode, int, int> $converterstatus =
      const EnumIndexConverter<StatusMode>(StatusMode.values);
  static JsonTypeConverter2<SharedMode, int, int> $converteraction =
      const EnumIndexConverter<SharedMode>(SharedMode.values);
}

class EvidenciastableData extends DataClass
    implements Insertable<EvidenciastableData> {
  final int idEvi;
  final int idRota;
  final int idFiscal;
  final TipoConstatacao tema;
  final String? identificacao;
  final String? alimentador;
  final String descricao;
  final String image;
  final String endereco;
  final String cep;
  final double lat;
  final double long;
  final DateTime horario;
  final StatusMode status;
  final SharedMode action;
  const EvidenciastableData({
    required this.idEvi,
    required this.idRota,
    required this.idFiscal,
    required this.tema,
    this.identificacao,
    this.alimentador,
    required this.descricao,
    required this.image,
    required this.endereco,
    required this.cep,
    required this.lat,
    required this.long,
    required this.horario,
    required this.status,
    required this.action,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_evi'] = Variable<int>(idEvi);
    map['id_rota'] = Variable<int>(idRota);
    map['id_fiscal'] = Variable<int>(idFiscal);
    {
      map['tema'] = Variable<int>(
        $EvidenciastableTable.$convertertema.toSql(tema),
      );
    }
    if (!nullToAbsent || identificacao != null) {
      map['identificacao'] = Variable<String>(identificacao);
    }
    if (!nullToAbsent || alimentador != null) {
      map['alimentador'] = Variable<String>(alimentador);
    }
    map['descricao'] = Variable<String>(descricao);
    map['image'] = Variable<String>(image);
    map['endereco'] = Variable<String>(endereco);
    map['cep'] = Variable<String>(cep);
    map['lat'] = Variable<double>(lat);
    map['long'] = Variable<double>(long);
    map['horario'] = Variable<DateTime>(horario);
    {
      map['status'] = Variable<int>(
        $EvidenciastableTable.$converterstatus.toSql(status),
      );
    }
    {
      map['action'] = Variable<int>(
        $EvidenciastableTable.$converteraction.toSql(action),
      );
    }
    return map;
  }

  EvidenciastableCompanion toCompanion(bool nullToAbsent) {
    return EvidenciastableCompanion(
      idEvi: Value(idEvi),
      idRota: Value(idRota),
      idFiscal: Value(idFiscal),
      tema: Value(tema),
      identificacao: identificacao == null && nullToAbsent
          ? const Value.absent()
          : Value(identificacao),
      alimentador: alimentador == null && nullToAbsent
          ? const Value.absent()
          : Value(alimentador),
      descricao: Value(descricao),
      image: Value(image),
      endereco: Value(endereco),
      cep: Value(cep),
      lat: Value(lat),
      long: Value(long),
      horario: Value(horario),
      status: Value(status),
      action: Value(action),
    );
  }

  factory EvidenciastableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EvidenciastableData(
      idEvi: serializer.fromJson<int>(json['idEvi']),
      idRota: serializer.fromJson<int>(json['idRota']),
      idFiscal: serializer.fromJson<int>(json['idFiscal']),
      tema: $EvidenciastableTable.$convertertema.fromJson(
        serializer.fromJson<int>(json['tema']),
      ),
      identificacao: serializer.fromJson<String?>(json['identificacao']),
      alimentador: serializer.fromJson<String?>(json['alimentador']),
      descricao: serializer.fromJson<String>(json['descricao']),
      image: serializer.fromJson<String>(json['image']),
      endereco: serializer.fromJson<String>(json['endereco']),
      cep: serializer.fromJson<String>(json['cep']),
      lat: serializer.fromJson<double>(json['lat']),
      long: serializer.fromJson<double>(json['long']),
      horario: serializer.fromJson<DateTime>(json['horario']),
      status: $EvidenciastableTable.$converterstatus.fromJson(
        serializer.fromJson<int>(json['status']),
      ),
      action: $EvidenciastableTable.$converteraction.fromJson(
        serializer.fromJson<int>(json['action']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idEvi': serializer.toJson<int>(idEvi),
      'idRota': serializer.toJson<int>(idRota),
      'idFiscal': serializer.toJson<int>(idFiscal),
      'tema': serializer.toJson<int>(
        $EvidenciastableTable.$convertertema.toJson(tema),
      ),
      'identificacao': serializer.toJson<String?>(identificacao),
      'alimentador': serializer.toJson<String?>(alimentador),
      'descricao': serializer.toJson<String>(descricao),
      'image': serializer.toJson<String>(image),
      'endereco': serializer.toJson<String>(endereco),
      'cep': serializer.toJson<String>(cep),
      'lat': serializer.toJson<double>(lat),
      'long': serializer.toJson<double>(long),
      'horario': serializer.toJson<DateTime>(horario),
      'status': serializer.toJson<int>(
        $EvidenciastableTable.$converterstatus.toJson(status),
      ),
      'action': serializer.toJson<int>(
        $EvidenciastableTable.$converteraction.toJson(action),
      ),
    };
  }

  EvidenciastableData copyWith({
    int? idEvi,
    int? idRota,
    int? idFiscal,
    TipoConstatacao? tema,
    Value<String?> identificacao = const Value.absent(),
    Value<String?> alimentador = const Value.absent(),
    String? descricao,
    String? image,
    String? endereco,
    String? cep,
    double? lat,
    double? long,
    DateTime? horario,
    StatusMode? status,
    SharedMode? action,
  }) => EvidenciastableData(
    idEvi: idEvi ?? this.idEvi,
    idRota: idRota ?? this.idRota,
    idFiscal: idFiscal ?? this.idFiscal,
    tema: tema ?? this.tema,
    identificacao: identificacao.present
        ? identificacao.value
        : this.identificacao,
    alimentador: alimentador.present ? alimentador.value : this.alimentador,
    descricao: descricao ?? this.descricao,
    image: image ?? this.image,
    endereco: endereco ?? this.endereco,
    cep: cep ?? this.cep,
    lat: lat ?? this.lat,
    long: long ?? this.long,
    horario: horario ?? this.horario,
    status: status ?? this.status,
    action: action ?? this.action,
  );
  EvidenciastableData copyWithCompanion(EvidenciastableCompanion data) {
    return EvidenciastableData(
      idEvi: data.idEvi.present ? data.idEvi.value : this.idEvi,
      idRota: data.idRota.present ? data.idRota.value : this.idRota,
      idFiscal: data.idFiscal.present ? data.idFiscal.value : this.idFiscal,
      tema: data.tema.present ? data.tema.value : this.tema,
      identificacao: data.identificacao.present
          ? data.identificacao.value
          : this.identificacao,
      alimentador: data.alimentador.present
          ? data.alimentador.value
          : this.alimentador,
      descricao: data.descricao.present ? data.descricao.value : this.descricao,
      image: data.image.present ? data.image.value : this.image,
      endereco: data.endereco.present ? data.endereco.value : this.endereco,
      cep: data.cep.present ? data.cep.value : this.cep,
      lat: data.lat.present ? data.lat.value : this.lat,
      long: data.long.present ? data.long.value : this.long,
      horario: data.horario.present ? data.horario.value : this.horario,
      status: data.status.present ? data.status.value : this.status,
      action: data.action.present ? data.action.value : this.action,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EvidenciastableData(')
          ..write('idEvi: $idEvi, ')
          ..write('idRota: $idRota, ')
          ..write('idFiscal: $idFiscal, ')
          ..write('tema: $tema, ')
          ..write('identificacao: $identificacao, ')
          ..write('alimentador: $alimentador, ')
          ..write('descricao: $descricao, ')
          ..write('image: $image, ')
          ..write('endereco: $endereco, ')
          ..write('cep: $cep, ')
          ..write('lat: $lat, ')
          ..write('long: $long, ')
          ..write('horario: $horario, ')
          ..write('status: $status, ')
          ..write('action: $action')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idEvi,
    idRota,
    idFiscal,
    tema,
    identificacao,
    alimentador,
    descricao,
    image,
    endereco,
    cep,
    lat,
    long,
    horario,
    status,
    action,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EvidenciastableData &&
          other.idEvi == this.idEvi &&
          other.idRota == this.idRota &&
          other.idFiscal == this.idFiscal &&
          other.tema == this.tema &&
          other.identificacao == this.identificacao &&
          other.alimentador == this.alimentador &&
          other.descricao == this.descricao &&
          other.image == this.image &&
          other.endereco == this.endereco &&
          other.cep == this.cep &&
          other.lat == this.lat &&
          other.long == this.long &&
          other.horario == this.horario &&
          other.status == this.status &&
          other.action == this.action);
}

class EvidenciastableCompanion extends UpdateCompanion<EvidenciastableData> {
  final Value<int> idEvi;
  final Value<int> idRota;
  final Value<int> idFiscal;
  final Value<TipoConstatacao> tema;
  final Value<String?> identificacao;
  final Value<String?> alimentador;
  final Value<String> descricao;
  final Value<String> image;
  final Value<String> endereco;
  final Value<String> cep;
  final Value<double> lat;
  final Value<double> long;
  final Value<DateTime> horario;
  final Value<StatusMode> status;
  final Value<SharedMode> action;
  const EvidenciastableCompanion({
    this.idEvi = const Value.absent(),
    this.idRota = const Value.absent(),
    this.idFiscal = const Value.absent(),
    this.tema = const Value.absent(),
    this.identificacao = const Value.absent(),
    this.alimentador = const Value.absent(),
    this.descricao = const Value.absent(),
    this.image = const Value.absent(),
    this.endereco = const Value.absent(),
    this.cep = const Value.absent(),
    this.lat = const Value.absent(),
    this.long = const Value.absent(),
    this.horario = const Value.absent(),
    this.status = const Value.absent(),
    this.action = const Value.absent(),
  });
  EvidenciastableCompanion.insert({
    this.idEvi = const Value.absent(),
    required int idRota,
    required int idFiscal,
    this.tema = const Value.absent(),
    this.identificacao = const Value.absent(),
    this.alimentador = const Value.absent(),
    required String descricao,
    required String image,
    required String endereco,
    required String cep,
    required double lat,
    required double long,
    this.horario = const Value.absent(),
    this.status = const Value.absent(),
    this.action = const Value.absent(),
  }) : idRota = Value(idRota),
       idFiscal = Value(idFiscal),
       descricao = Value(descricao),
       image = Value(image),
       endereco = Value(endereco),
       cep = Value(cep),
       lat = Value(lat),
       long = Value(long);
  static Insertable<EvidenciastableData> custom({
    Expression<int>? idEvi,
    Expression<int>? idRota,
    Expression<int>? idFiscal,
    Expression<int>? tema,
    Expression<String>? identificacao,
    Expression<String>? alimentador,
    Expression<String>? descricao,
    Expression<String>? image,
    Expression<String>? endereco,
    Expression<String>? cep,
    Expression<double>? lat,
    Expression<double>? long,
    Expression<DateTime>? horario,
    Expression<int>? status,
    Expression<int>? action,
  }) {
    return RawValuesInsertable({
      if (idEvi != null) 'id_evi': idEvi,
      if (idRota != null) 'id_rota': idRota,
      if (idFiscal != null) 'id_fiscal': idFiscal,
      if (tema != null) 'tema': tema,
      if (identificacao != null) 'identificacao': identificacao,
      if (alimentador != null) 'alimentador': alimentador,
      if (descricao != null) 'descricao': descricao,
      if (image != null) 'image': image,
      if (endereco != null) 'endereco': endereco,
      if (cep != null) 'cep': cep,
      if (lat != null) 'lat': lat,
      if (long != null) 'long': long,
      if (horario != null) 'horario': horario,
      if (status != null) 'status': status,
      if (action != null) 'action': action,
    });
  }

  EvidenciastableCompanion copyWith({
    Value<int>? idEvi,
    Value<int>? idRota,
    Value<int>? idFiscal,
    Value<TipoConstatacao>? tema,
    Value<String?>? identificacao,
    Value<String?>? alimentador,
    Value<String>? descricao,
    Value<String>? image,
    Value<String>? endereco,
    Value<String>? cep,
    Value<double>? lat,
    Value<double>? long,
    Value<DateTime>? horario,
    Value<StatusMode>? status,
    Value<SharedMode>? action,
  }) {
    return EvidenciastableCompanion(
      idEvi: idEvi ?? this.idEvi,
      idRota: idRota ?? this.idRota,
      idFiscal: idFiscal ?? this.idFiscal,
      tema: tema ?? this.tema,
      identificacao: identificacao ?? this.identificacao,
      alimentador: alimentador ?? this.alimentador,
      descricao: descricao ?? this.descricao,
      image: image ?? this.image,
      endereco: endereco ?? this.endereco,
      cep: cep ?? this.cep,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      horario: horario ?? this.horario,
      status: status ?? this.status,
      action: action ?? this.action,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idEvi.present) {
      map['id_evi'] = Variable<int>(idEvi.value);
    }
    if (idRota.present) {
      map['id_rota'] = Variable<int>(idRota.value);
    }
    if (idFiscal.present) {
      map['id_fiscal'] = Variable<int>(idFiscal.value);
    }
    if (tema.present) {
      map['tema'] = Variable<int>(
        $EvidenciastableTable.$convertertema.toSql(tema.value),
      );
    }
    if (identificacao.present) {
      map['identificacao'] = Variable<String>(identificacao.value);
    }
    if (alimentador.present) {
      map['alimentador'] = Variable<String>(alimentador.value);
    }
    if (descricao.present) {
      map['descricao'] = Variable<String>(descricao.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (endereco.present) {
      map['endereco'] = Variable<String>(endereco.value);
    }
    if (cep.present) {
      map['cep'] = Variable<String>(cep.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (long.present) {
      map['long'] = Variable<double>(long.value);
    }
    if (horario.present) {
      map['horario'] = Variable<DateTime>(horario.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(
        $EvidenciastableTable.$converterstatus.toSql(status.value),
      );
    }
    if (action.present) {
      map['action'] = Variable<int>(
        $EvidenciastableTable.$converteraction.toSql(action.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EvidenciastableCompanion(')
          ..write('idEvi: $idEvi, ')
          ..write('idRota: $idRota, ')
          ..write('idFiscal: $idFiscal, ')
          ..write('tema: $tema, ')
          ..write('identificacao: $identificacao, ')
          ..write('alimentador: $alimentador, ')
          ..write('descricao: $descricao, ')
          ..write('image: $image, ')
          ..write('endereco: $endereco, ')
          ..write('cep: $cep, ')
          ..write('lat: $lat, ')
          ..write('long: $long, ')
          ..write('horario: $horario, ')
          ..write('status: $status, ')
          ..write('action: $action')
          ..write(')'))
        .toString();
  }
}

class $RotastableTable extends Rotastable
    with TableInfo<$RotastableTable, RotastableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RotastableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idRotaMeta = const VerificationMeta('idRota');
  @override
  late final GeneratedColumn<int> idRota = GeneratedColumn<int>(
    'id_rota',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nomeRotaMeta = const VerificationMeta(
    'nomeRota',
  );
  @override
  late final GeneratedColumn<String> nomeRota = GeneratedColumn<String>(
    'nome_rota',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _alimentadorMeta = const VerificationMeta(
    'alimentador',
  );
  @override
  late final GeneratedColumn<String> alimentador = GeneratedColumn<String>(
    'alimentador',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataInicioMeta = const VerificationMeta(
    'dataInicio',
  );
  @override
  late final GeneratedColumn<String> dataInicio = GeneratedColumn<String>(
    'data_inicio',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    idRota,
    nomeRota,
    alimentador,
    dataInicio,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rotastable';
  @override
  VerificationContext validateIntegrity(
    Insertable<RotastableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_rota')) {
      context.handle(
        _idRotaMeta,
        idRota.isAcceptableOrUnknown(data['id_rota']!, _idRotaMeta),
      );
    }
    if (data.containsKey('nome_rota')) {
      context.handle(
        _nomeRotaMeta,
        nomeRota.isAcceptableOrUnknown(data['nome_rota']!, _nomeRotaMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeRotaMeta);
    }
    if (data.containsKey('alimentador')) {
      context.handle(
        _alimentadorMeta,
        alimentador.isAcceptableOrUnknown(
          data['alimentador']!,
          _alimentadorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_alimentadorMeta);
    }
    if (data.containsKey('data_inicio')) {
      context.handle(
        _dataInicioMeta,
        dataInicio.isAcceptableOrUnknown(data['data_inicio']!, _dataInicioMeta),
      );
    } else if (isInserting) {
      context.missing(_dataInicioMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idRota};
  @override
  RotastableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RotastableData(
      idRota: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_rota'],
      )!,
      nomeRota: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome_rota'],
      )!,
      alimentador: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alimentador'],
      )!,
      dataInicio: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data_inicio'],
      )!,
    );
  }

  @override
  $RotastableTable createAlias(String alias) {
    return $RotastableTable(attachedDatabase, alias);
  }
}

class RotastableData extends DataClass implements Insertable<RotastableData> {
  final int idRota;
  final String nomeRota;
  final String alimentador;
  final String dataInicio;
  const RotastableData({
    required this.idRota,
    required this.nomeRota,
    required this.alimentador,
    required this.dataInicio,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_rota'] = Variable<int>(idRota);
    map['nome_rota'] = Variable<String>(nomeRota);
    map['alimentador'] = Variable<String>(alimentador);
    map['data_inicio'] = Variable<String>(dataInicio);
    return map;
  }

  RotastableCompanion toCompanion(bool nullToAbsent) {
    return RotastableCompanion(
      idRota: Value(idRota),
      nomeRota: Value(nomeRota),
      alimentador: Value(alimentador),
      dataInicio: Value(dataInicio),
    );
  }

  factory RotastableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RotastableData(
      idRota: serializer.fromJson<int>(json['idRota']),
      nomeRota: serializer.fromJson<String>(json['nomeRota']),
      alimentador: serializer.fromJson<String>(json['alimentador']),
      dataInicio: serializer.fromJson<String>(json['dataInicio']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idRota': serializer.toJson<int>(idRota),
      'nomeRota': serializer.toJson<String>(nomeRota),
      'alimentador': serializer.toJson<String>(alimentador),
      'dataInicio': serializer.toJson<String>(dataInicio),
    };
  }

  RotastableData copyWith({
    int? idRota,
    String? nomeRota,
    String? alimentador,
    String? dataInicio,
  }) => RotastableData(
    idRota: idRota ?? this.idRota,
    nomeRota: nomeRota ?? this.nomeRota,
    alimentador: alimentador ?? this.alimentador,
    dataInicio: dataInicio ?? this.dataInicio,
  );
  RotastableData copyWithCompanion(RotastableCompanion data) {
    return RotastableData(
      idRota: data.idRota.present ? data.idRota.value : this.idRota,
      nomeRota: data.nomeRota.present ? data.nomeRota.value : this.nomeRota,
      alimentador: data.alimentador.present
          ? data.alimentador.value
          : this.alimentador,
      dataInicio: data.dataInicio.present
          ? data.dataInicio.value
          : this.dataInicio,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RotastableData(')
          ..write('idRota: $idRota, ')
          ..write('nomeRota: $nomeRota, ')
          ..write('alimentador: $alimentador, ')
          ..write('dataInicio: $dataInicio')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idRota, nomeRota, alimentador, dataInicio);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RotastableData &&
          other.idRota == this.idRota &&
          other.nomeRota == this.nomeRota &&
          other.alimentador == this.alimentador &&
          other.dataInicio == this.dataInicio);
}

class RotastableCompanion extends UpdateCompanion<RotastableData> {
  final Value<int> idRota;
  final Value<String> nomeRota;
  final Value<String> alimentador;
  final Value<String> dataInicio;
  const RotastableCompanion({
    this.idRota = const Value.absent(),
    this.nomeRota = const Value.absent(),
    this.alimentador = const Value.absent(),
    this.dataInicio = const Value.absent(),
  });
  RotastableCompanion.insert({
    this.idRota = const Value.absent(),
    required String nomeRota,
    required String alimentador,
    required String dataInicio,
  }) : nomeRota = Value(nomeRota),
       alimentador = Value(alimentador),
       dataInicio = Value(dataInicio);
  static Insertable<RotastableData> custom({
    Expression<int>? idRota,
    Expression<String>? nomeRota,
    Expression<String>? alimentador,
    Expression<String>? dataInicio,
  }) {
    return RawValuesInsertable({
      if (idRota != null) 'id_rota': idRota,
      if (nomeRota != null) 'nome_rota': nomeRota,
      if (alimentador != null) 'alimentador': alimentador,
      if (dataInicio != null) 'data_inicio': dataInicio,
    });
  }

  RotastableCompanion copyWith({
    Value<int>? idRota,
    Value<String>? nomeRota,
    Value<String>? alimentador,
    Value<String>? dataInicio,
  }) {
    return RotastableCompanion(
      idRota: idRota ?? this.idRota,
      nomeRota: nomeRota ?? this.nomeRota,
      alimentador: alimentador ?? this.alimentador,
      dataInicio: dataInicio ?? this.dataInicio,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idRota.present) {
      map['id_rota'] = Variable<int>(idRota.value);
    }
    if (nomeRota.present) {
      map['nome_rota'] = Variable<String>(nomeRota.value);
    }
    if (alimentador.present) {
      map['alimentador'] = Variable<String>(alimentador.value);
    }
    if (dataInicio.present) {
      map['data_inicio'] = Variable<String>(dataInicio.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RotastableCompanion(')
          ..write('idRota: $idRota, ')
          ..write('nomeRota: $nomeRota, ')
          ..write('alimentador: $alimentador, ')
          ..write('dataInicio: $dataInicio')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $EvidenciastableTable evidenciastable = $EvidenciastableTable(
    this,
  );
  late final $RotastableTable rotastable = $RotastableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    evidenciastable,
    rotastable,
  ];
}

typedef $$EvidenciastableTableCreateCompanionBuilder =
    EvidenciastableCompanion Function({
      Value<int> idEvi,
      required int idRota,
      required int idFiscal,
      Value<TipoConstatacao> tema,
      Value<String?> identificacao,
      Value<String?> alimentador,
      required String descricao,
      required String image,
      required String endereco,
      required String cep,
      required double lat,
      required double long,
      Value<DateTime> horario,
      Value<StatusMode> status,
      Value<SharedMode> action,
    });
typedef $$EvidenciastableTableUpdateCompanionBuilder =
    EvidenciastableCompanion Function({
      Value<int> idEvi,
      Value<int> idRota,
      Value<int> idFiscal,
      Value<TipoConstatacao> tema,
      Value<String?> identificacao,
      Value<String?> alimentador,
      Value<String> descricao,
      Value<String> image,
      Value<String> endereco,
      Value<String> cep,
      Value<double> lat,
      Value<double> long,
      Value<DateTime> horario,
      Value<StatusMode> status,
      Value<SharedMode> action,
    });

class $$EvidenciastableTableFilterComposer
    extends Composer<_$AppDatabase, $EvidenciastableTable> {
  $$EvidenciastableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idEvi => $composableBuilder(
    column: $table.idEvi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get idRota => $composableBuilder(
    column: $table.idRota,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get idFiscal => $composableBuilder(
    column: $table.idFiscal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TipoConstatacao, TipoConstatacao, int>
  get tema => $composableBuilder(
    column: $table.tema,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get identificacao => $composableBuilder(
    column: $table.identificacao,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get alimentador => $composableBuilder(
    column: $table.alimentador,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descricao => $composableBuilder(
    column: $table.descricao,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endereco => $composableBuilder(
    column: $table.endereco,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cep => $composableBuilder(
    column: $table.cep,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get long => $composableBuilder(
    column: $table.long,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get horario => $composableBuilder(
    column: $table.horario,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<StatusMode, StatusMode, int> get status =>
      $composableBuilder(
        column: $table.status,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<SharedMode, SharedMode, int> get action =>
      $composableBuilder(
        column: $table.action,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );
}

class $$EvidenciastableTableOrderingComposer
    extends Composer<_$AppDatabase, $EvidenciastableTable> {
  $$EvidenciastableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idEvi => $composableBuilder(
    column: $table.idEvi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get idRota => $composableBuilder(
    column: $table.idRota,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get idFiscal => $composableBuilder(
    column: $table.idFiscal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tema => $composableBuilder(
    column: $table.tema,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get identificacao => $composableBuilder(
    column: $table.identificacao,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get alimentador => $composableBuilder(
    column: $table.alimentador,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descricao => $composableBuilder(
    column: $table.descricao,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endereco => $composableBuilder(
    column: $table.endereco,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cep => $composableBuilder(
    column: $table.cep,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get long => $composableBuilder(
    column: $table.long,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get horario => $composableBuilder(
    column: $table.horario,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EvidenciastableTableAnnotationComposer
    extends Composer<_$AppDatabase, $EvidenciastableTable> {
  $$EvidenciastableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idEvi =>
      $composableBuilder(column: $table.idEvi, builder: (column) => column);

  GeneratedColumn<int> get idRota =>
      $composableBuilder(column: $table.idRota, builder: (column) => column);

  GeneratedColumn<int> get idFiscal =>
      $composableBuilder(column: $table.idFiscal, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TipoConstatacao, int> get tema =>
      $composableBuilder(column: $table.tema, builder: (column) => column);

  GeneratedColumn<String> get identificacao => $composableBuilder(
    column: $table.identificacao,
    builder: (column) => column,
  );

  GeneratedColumn<String> get alimentador => $composableBuilder(
    column: $table.alimentador,
    builder: (column) => column,
  );

  GeneratedColumn<String> get descricao =>
      $composableBuilder(column: $table.descricao, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get endereco =>
      $composableBuilder(column: $table.endereco, builder: (column) => column);

  GeneratedColumn<String> get cep =>
      $composableBuilder(column: $table.cep, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get long =>
      $composableBuilder(column: $table.long, builder: (column) => column);

  GeneratedColumn<DateTime> get horario =>
      $composableBuilder(column: $table.horario, builder: (column) => column);

  GeneratedColumnWithTypeConverter<StatusMode, int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SharedMode, int> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);
}

class $$EvidenciastableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EvidenciastableTable,
          EvidenciastableData,
          $$EvidenciastableTableFilterComposer,
          $$EvidenciastableTableOrderingComposer,
          $$EvidenciastableTableAnnotationComposer,
          $$EvidenciastableTableCreateCompanionBuilder,
          $$EvidenciastableTableUpdateCompanionBuilder,
          (
            EvidenciastableData,
            BaseReferences<
              _$AppDatabase,
              $EvidenciastableTable,
              EvidenciastableData
            >,
          ),
          EvidenciastableData,
          PrefetchHooks Function()
        > {
  $$EvidenciastableTableTableManager(
    _$AppDatabase db,
    $EvidenciastableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EvidenciastableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EvidenciastableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EvidenciastableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idEvi = const Value.absent(),
                Value<int> idRota = const Value.absent(),
                Value<int> idFiscal = const Value.absent(),
                Value<TipoConstatacao> tema = const Value.absent(),
                Value<String?> identificacao = const Value.absent(),
                Value<String?> alimentador = const Value.absent(),
                Value<String> descricao = const Value.absent(),
                Value<String> image = const Value.absent(),
                Value<String> endereco = const Value.absent(),
                Value<String> cep = const Value.absent(),
                Value<double> lat = const Value.absent(),
                Value<double> long = const Value.absent(),
                Value<DateTime> horario = const Value.absent(),
                Value<StatusMode> status = const Value.absent(),
                Value<SharedMode> action = const Value.absent(),
              }) => EvidenciastableCompanion(
                idEvi: idEvi,
                idRota: idRota,
                idFiscal: idFiscal,
                tema: tema,
                identificacao: identificacao,
                alimentador: alimentador,
                descricao: descricao,
                image: image,
                endereco: endereco,
                cep: cep,
                lat: lat,
                long: long,
                horario: horario,
                status: status,
                action: action,
              ),
          createCompanionCallback:
              ({
                Value<int> idEvi = const Value.absent(),
                required int idRota,
                required int idFiscal,
                Value<TipoConstatacao> tema = const Value.absent(),
                Value<String?> identificacao = const Value.absent(),
                Value<String?> alimentador = const Value.absent(),
                required String descricao,
                required String image,
                required String endereco,
                required String cep,
                required double lat,
                required double long,
                Value<DateTime> horario = const Value.absent(),
                Value<StatusMode> status = const Value.absent(),
                Value<SharedMode> action = const Value.absent(),
              }) => EvidenciastableCompanion.insert(
                idEvi: idEvi,
                idRota: idRota,
                idFiscal: idFiscal,
                tema: tema,
                identificacao: identificacao,
                alimentador: alimentador,
                descricao: descricao,
                image: image,
                endereco: endereco,
                cep: cep,
                lat: lat,
                long: long,
                horario: horario,
                status: status,
                action: action,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EvidenciastableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EvidenciastableTable,
      EvidenciastableData,
      $$EvidenciastableTableFilterComposer,
      $$EvidenciastableTableOrderingComposer,
      $$EvidenciastableTableAnnotationComposer,
      $$EvidenciastableTableCreateCompanionBuilder,
      $$EvidenciastableTableUpdateCompanionBuilder,
      (
        EvidenciastableData,
        BaseReferences<
          _$AppDatabase,
          $EvidenciastableTable,
          EvidenciastableData
        >,
      ),
      EvidenciastableData,
      PrefetchHooks Function()
    >;
typedef $$RotastableTableCreateCompanionBuilder =
    RotastableCompanion Function({
      Value<int> idRota,
      required String nomeRota,
      required String alimentador,
      required String dataInicio,
    });
typedef $$RotastableTableUpdateCompanionBuilder =
    RotastableCompanion Function({
      Value<int> idRota,
      Value<String> nomeRota,
      Value<String> alimentador,
      Value<String> dataInicio,
    });

class $$RotastableTableFilterComposer
    extends Composer<_$AppDatabase, $RotastableTable> {
  $$RotastableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idRota => $composableBuilder(
    column: $table.idRota,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nomeRota => $composableBuilder(
    column: $table.nomeRota,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get alimentador => $composableBuilder(
    column: $table.alimentador,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dataInicio => $composableBuilder(
    column: $table.dataInicio,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RotastableTableOrderingComposer
    extends Composer<_$AppDatabase, $RotastableTable> {
  $$RotastableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idRota => $composableBuilder(
    column: $table.idRota,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nomeRota => $composableBuilder(
    column: $table.nomeRota,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get alimentador => $composableBuilder(
    column: $table.alimentador,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataInicio => $composableBuilder(
    column: $table.dataInicio,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RotastableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RotastableTable> {
  $$RotastableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idRota =>
      $composableBuilder(column: $table.idRota, builder: (column) => column);

  GeneratedColumn<String> get nomeRota =>
      $composableBuilder(column: $table.nomeRota, builder: (column) => column);

  GeneratedColumn<String> get alimentador => $composableBuilder(
    column: $table.alimentador,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dataInicio => $composableBuilder(
    column: $table.dataInicio,
    builder: (column) => column,
  );
}

class $$RotastableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RotastableTable,
          RotastableData,
          $$RotastableTableFilterComposer,
          $$RotastableTableOrderingComposer,
          $$RotastableTableAnnotationComposer,
          $$RotastableTableCreateCompanionBuilder,
          $$RotastableTableUpdateCompanionBuilder,
          (
            RotastableData,
            BaseReferences<_$AppDatabase, $RotastableTable, RotastableData>,
          ),
          RotastableData,
          PrefetchHooks Function()
        > {
  $$RotastableTableTableManager(_$AppDatabase db, $RotastableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RotastableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RotastableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RotastableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idRota = const Value.absent(),
                Value<String> nomeRota = const Value.absent(),
                Value<String> alimentador = const Value.absent(),
                Value<String> dataInicio = const Value.absent(),
              }) => RotastableCompanion(
                idRota: idRota,
                nomeRota: nomeRota,
                alimentador: alimentador,
                dataInicio: dataInicio,
              ),
          createCompanionCallback:
              ({
                Value<int> idRota = const Value.absent(),
                required String nomeRota,
                required String alimentador,
                required String dataInicio,
              }) => RotastableCompanion.insert(
                idRota: idRota,
                nomeRota: nomeRota,
                alimentador: alimentador,
                dataInicio: dataInicio,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RotastableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RotastableTable,
      RotastableData,
      $$RotastableTableFilterComposer,
      $$RotastableTableOrderingComposer,
      $$RotastableTableAnnotationComposer,
      $$RotastableTableCreateCompanionBuilder,
      $$RotastableTableUpdateCompanionBuilder,
      (
        RotastableData,
        BaseReferences<_$AppDatabase, $RotastableTable, RotastableData>,
      ),
      RotastableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$EvidenciastableTableTableManager get evidenciastable =>
      $$EvidenciastableTableTableManager(_db, _db.evidenciastable);
  $$RotastableTableTableManager get rotastable =>
      $$RotastableTableTableManager(_db, _db.rotastable);
}
