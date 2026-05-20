// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $EvidenciastableTable extends Evidenciastable
    with TableInfo<$EvidenciastableTable, EvidenciastableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EvidenciastableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _evidenciaIdMeta = const VerificationMeta(
    'evidenciaId',
  );
  @override
  late final GeneratedColumn<String> evidenciaId = GeneratedColumn<String>(
    'evidencia_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idRotaMeta = const VerificationMeta('idRota');
  @override
  late final GeneratedColumn<String> idRota = GeneratedColumn<String>(
    'id_rota',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idFiscalMeta = const VerificationMeta(
    'idFiscal',
  );
  @override
  late final GeneratedColumn<int> idFiscal = GeneratedColumn<int>(
    'id_fiscal',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _temaFiscalizacaoMeta = const VerificationMeta(
    'temaFiscalizacao',
  );
  @override
  late final GeneratedColumn<int> temaFiscalizacao = GeneratedColumn<int>(
    'tema_fiscalizacao',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _subTemaFiscalizacaoMeta =
      const VerificationMeta('subTemaFiscalizacao');
  @override
  late final GeneratedColumn<String> subTemaFiscalizacao =
      GeneratedColumn<String>(
        'sub_tema_fiscalizacao',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
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
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _enderecoMeta = const VerificationMeta(
    'endereco',
  );
  @override
  late final GeneratedColumn<String> endereco = GeneratedColumn<String>(
    'endereco',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cidadeMeta = const VerificationMeta('cidade');
  @override
  late final GeneratedColumn<String> cidade = GeneratedColumn<String>(
    'cidade',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _longMeta = const VerificationMeta('long');
  @override
  late final GeneratedColumn<double> long = GeneratedColumn<double>(
    'long',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _horarioMeta = const VerificationMeta(
    'horario',
  );
  @override
  late final GeneratedColumn<DateTime> horario = GeneratedColumn<DateTime>(
    'horario',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _emergencialMeta = const VerificationMeta(
    'emergencial',
  );
  @override
  late final GeneratedColumn<bool> emergencial = GeneratedColumn<bool>(
    'emergencial',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("emergencial" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
    evidenciaId,
    idRota,
    idFiscal,
    temaFiscalizacao,
    subTemaFiscalizacao,
    identificacao,
    alimentador,
    descricao,
    image,
    endereco,
    cidade,
    lat,
    long,
    horario,
    emergencial,
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
    if (data.containsKey('evidencia_id')) {
      context.handle(
        _evidenciaIdMeta,
        evidenciaId.isAcceptableOrUnknown(
          data['evidencia_id']!,
          _evidenciaIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_evidenciaIdMeta);
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
    }
    if (data.containsKey('tema_fiscalizacao')) {
      context.handle(
        _temaFiscalizacaoMeta,
        temaFiscalizacao.isAcceptableOrUnknown(
          data['tema_fiscalizacao']!,
          _temaFiscalizacaoMeta,
        ),
      );
    }
    if (data.containsKey('sub_tema_fiscalizacao')) {
      context.handle(
        _subTemaFiscalizacaoMeta,
        subTemaFiscalizacao.isAcceptableOrUnknown(
          data['sub_tema_fiscalizacao']!,
          _subTemaFiscalizacaoMeta,
        ),
      );
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
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    }
    if (data.containsKey('endereco')) {
      context.handle(
        _enderecoMeta,
        endereco.isAcceptableOrUnknown(data['endereco']!, _enderecoMeta),
      );
    }
    if (data.containsKey('cidade')) {
      context.handle(
        _cidadeMeta,
        cidade.isAcceptableOrUnknown(data['cidade']!, _cidadeMeta),
      );
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    }
    if (data.containsKey('long')) {
      context.handle(
        _longMeta,
        long.isAcceptableOrUnknown(data['long']!, _longMeta),
      );
    }
    if (data.containsKey('horario')) {
      context.handle(
        _horarioMeta,
        horario.isAcceptableOrUnknown(data['horario']!, _horarioMeta),
      );
    }
    if (data.containsKey('emergencial')) {
      context.handle(
        _emergencialMeta,
        emergencial.isAcceptableOrUnknown(
          data['emergencial']!,
          _emergencialMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  EvidenciastableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EvidenciastableData(
      evidenciaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}evidencia_id'],
      )!,
      idRota: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_rota'],
      )!,
      idFiscal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_fiscal'],
      ),
      temaFiscalizacao: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tema_fiscalizacao'],
      ),
      subTemaFiscalizacao: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sub_tema_fiscalizacao'],
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
      ),
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      ),
      endereco: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}endereco'],
      ),
      cidade: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cidade'],
      ),
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      ),
      long: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}long'],
      ),
      horario: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}horario'],
      ),
      emergencial: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}emergencial'],
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

  static JsonTypeConverter2<StatusMode, int, int> $converterstatus =
      const EnumIndexConverter<StatusMode>(StatusMode.values);
  static JsonTypeConverter2<SharedMode, int, int> $converteraction =
      const EnumIndexConverter<SharedMode>(SharedMode.values);
}

class EvidenciastableData extends DataClass
    implements Insertable<EvidenciastableData> {
  final String evidenciaId;
  final String idRota;
  final int? idFiscal;
  final int? temaFiscalizacao;
  final String? subTemaFiscalizacao;
  final String? identificacao;
  final String? alimentador;
  final String? descricao;
  final String? image;
  final String? endereco;
  final String? cidade;
  final double? lat;
  final double? long;
  final DateTime? horario;
  final bool emergencial;
  final StatusMode status;
  final SharedMode action;
  const EvidenciastableData({
    required this.evidenciaId,
    required this.idRota,
    this.idFiscal,
    this.temaFiscalizacao,
    this.subTemaFiscalizacao,
    this.identificacao,
    this.alimentador,
    this.descricao,
    this.image,
    this.endereco,
    this.cidade,
    this.lat,
    this.long,
    this.horario,
    required this.emergencial,
    required this.status,
    required this.action,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['evidencia_id'] = Variable<String>(evidenciaId);
    map['id_rota'] = Variable<String>(idRota);
    if (!nullToAbsent || idFiscal != null) {
      map['id_fiscal'] = Variable<int>(idFiscal);
    }
    if (!nullToAbsent || temaFiscalizacao != null) {
      map['tema_fiscalizacao'] = Variable<int>(temaFiscalizacao);
    }
    if (!nullToAbsent || subTemaFiscalizacao != null) {
      map['sub_tema_fiscalizacao'] = Variable<String>(subTemaFiscalizacao);
    }
    if (!nullToAbsent || identificacao != null) {
      map['identificacao'] = Variable<String>(identificacao);
    }
    if (!nullToAbsent || alimentador != null) {
      map['alimentador'] = Variable<String>(alimentador);
    }
    if (!nullToAbsent || descricao != null) {
      map['descricao'] = Variable<String>(descricao);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || endereco != null) {
      map['endereco'] = Variable<String>(endereco);
    }
    if (!nullToAbsent || cidade != null) {
      map['cidade'] = Variable<String>(cidade);
    }
    if (!nullToAbsent || lat != null) {
      map['lat'] = Variable<double>(lat);
    }
    if (!nullToAbsent || long != null) {
      map['long'] = Variable<double>(long);
    }
    if (!nullToAbsent || horario != null) {
      map['horario'] = Variable<DateTime>(horario);
    }
    map['emergencial'] = Variable<bool>(emergencial);
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
      evidenciaId: Value(evidenciaId),
      idRota: Value(idRota),
      idFiscal: idFiscal == null && nullToAbsent
          ? const Value.absent()
          : Value(idFiscal),
      temaFiscalizacao: temaFiscalizacao == null && nullToAbsent
          ? const Value.absent()
          : Value(temaFiscalizacao),
      subTemaFiscalizacao: subTemaFiscalizacao == null && nullToAbsent
          ? const Value.absent()
          : Value(subTemaFiscalizacao),
      identificacao: identificacao == null && nullToAbsent
          ? const Value.absent()
          : Value(identificacao),
      alimentador: alimentador == null && nullToAbsent
          ? const Value.absent()
          : Value(alimentador),
      descricao: descricao == null && nullToAbsent
          ? const Value.absent()
          : Value(descricao),
      image: image == null && nullToAbsent
          ? const Value.absent()
          : Value(image),
      endereco: endereco == null && nullToAbsent
          ? const Value.absent()
          : Value(endereco),
      cidade: cidade == null && nullToAbsent
          ? const Value.absent()
          : Value(cidade),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
      long: long == null && nullToAbsent ? const Value.absent() : Value(long),
      horario: horario == null && nullToAbsent
          ? const Value.absent()
          : Value(horario),
      emergencial: Value(emergencial),
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
      evidenciaId: serializer.fromJson<String>(json['evidenciaId']),
      idRota: serializer.fromJson<String>(json['idRota']),
      idFiscal: serializer.fromJson<int?>(json['idFiscal']),
      temaFiscalizacao: serializer.fromJson<int?>(json['temaFiscalizacao']),
      subTemaFiscalizacao: serializer.fromJson<String?>(
        json['subTemaFiscalizacao'],
      ),
      identificacao: serializer.fromJson<String?>(json['identificacao']),
      alimentador: serializer.fromJson<String?>(json['alimentador']),
      descricao: serializer.fromJson<String?>(json['descricao']),
      image: serializer.fromJson<String?>(json['image']),
      endereco: serializer.fromJson<String?>(json['endereco']),
      cidade: serializer.fromJson<String?>(json['cidade']),
      lat: serializer.fromJson<double?>(json['lat']),
      long: serializer.fromJson<double?>(json['long']),
      horario: serializer.fromJson<DateTime?>(json['horario']),
      emergencial: serializer.fromJson<bool>(json['emergencial']),
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
      'evidenciaId': serializer.toJson<String>(evidenciaId),
      'idRota': serializer.toJson<String>(idRota),
      'idFiscal': serializer.toJson<int?>(idFiscal),
      'temaFiscalizacao': serializer.toJson<int?>(temaFiscalizacao),
      'subTemaFiscalizacao': serializer.toJson<String?>(subTemaFiscalizacao),
      'identificacao': serializer.toJson<String?>(identificacao),
      'alimentador': serializer.toJson<String?>(alimentador),
      'descricao': serializer.toJson<String?>(descricao),
      'image': serializer.toJson<String?>(image),
      'endereco': serializer.toJson<String?>(endereco),
      'cidade': serializer.toJson<String?>(cidade),
      'lat': serializer.toJson<double?>(lat),
      'long': serializer.toJson<double?>(long),
      'horario': serializer.toJson<DateTime?>(horario),
      'emergencial': serializer.toJson<bool>(emergencial),
      'status': serializer.toJson<int>(
        $EvidenciastableTable.$converterstatus.toJson(status),
      ),
      'action': serializer.toJson<int>(
        $EvidenciastableTable.$converteraction.toJson(action),
      ),
    };
  }

  EvidenciastableData copyWith({
    String? evidenciaId,
    String? idRota,
    Value<int?> idFiscal = const Value.absent(),
    Value<int?> temaFiscalizacao = const Value.absent(),
    Value<String?> subTemaFiscalizacao = const Value.absent(),
    Value<String?> identificacao = const Value.absent(),
    Value<String?> alimentador = const Value.absent(),
    Value<String?> descricao = const Value.absent(),
    Value<String?> image = const Value.absent(),
    Value<String?> endereco = const Value.absent(),
    Value<String?> cidade = const Value.absent(),
    Value<double?> lat = const Value.absent(),
    Value<double?> long = const Value.absent(),
    Value<DateTime?> horario = const Value.absent(),
    bool? emergencial,
    StatusMode? status,
    SharedMode? action,
  }) => EvidenciastableData(
    evidenciaId: evidenciaId ?? this.evidenciaId,
    idRota: idRota ?? this.idRota,
    idFiscal: idFiscal.present ? idFiscal.value : this.idFiscal,
    temaFiscalizacao: temaFiscalizacao.present
        ? temaFiscalizacao.value
        : this.temaFiscalizacao,
    subTemaFiscalizacao: subTemaFiscalizacao.present
        ? subTemaFiscalizacao.value
        : this.subTemaFiscalizacao,
    identificacao: identificacao.present
        ? identificacao.value
        : this.identificacao,
    alimentador: alimentador.present ? alimentador.value : this.alimentador,
    descricao: descricao.present ? descricao.value : this.descricao,
    image: image.present ? image.value : this.image,
    endereco: endereco.present ? endereco.value : this.endereco,
    cidade: cidade.present ? cidade.value : this.cidade,
    lat: lat.present ? lat.value : this.lat,
    long: long.present ? long.value : this.long,
    horario: horario.present ? horario.value : this.horario,
    emergencial: emergencial ?? this.emergencial,
    status: status ?? this.status,
    action: action ?? this.action,
  );
  EvidenciastableData copyWithCompanion(EvidenciastableCompanion data) {
    return EvidenciastableData(
      evidenciaId: data.evidenciaId.present
          ? data.evidenciaId.value
          : this.evidenciaId,
      idRota: data.idRota.present ? data.idRota.value : this.idRota,
      idFiscal: data.idFiscal.present ? data.idFiscal.value : this.idFiscal,
      temaFiscalizacao: data.temaFiscalizacao.present
          ? data.temaFiscalizacao.value
          : this.temaFiscalizacao,
      subTemaFiscalizacao: data.subTemaFiscalizacao.present
          ? data.subTemaFiscalizacao.value
          : this.subTemaFiscalizacao,
      identificacao: data.identificacao.present
          ? data.identificacao.value
          : this.identificacao,
      alimentador: data.alimentador.present
          ? data.alimentador.value
          : this.alimentador,
      descricao: data.descricao.present ? data.descricao.value : this.descricao,
      image: data.image.present ? data.image.value : this.image,
      endereco: data.endereco.present ? data.endereco.value : this.endereco,
      cidade: data.cidade.present ? data.cidade.value : this.cidade,
      lat: data.lat.present ? data.lat.value : this.lat,
      long: data.long.present ? data.long.value : this.long,
      horario: data.horario.present ? data.horario.value : this.horario,
      emergencial: data.emergencial.present
          ? data.emergencial.value
          : this.emergencial,
      status: data.status.present ? data.status.value : this.status,
      action: data.action.present ? data.action.value : this.action,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EvidenciastableData(')
          ..write('evidenciaId: $evidenciaId, ')
          ..write('idRota: $idRota, ')
          ..write('idFiscal: $idFiscal, ')
          ..write('temaFiscalizacao: $temaFiscalizacao, ')
          ..write('subTemaFiscalizacao: $subTemaFiscalizacao, ')
          ..write('identificacao: $identificacao, ')
          ..write('alimentador: $alimentador, ')
          ..write('descricao: $descricao, ')
          ..write('image: $image, ')
          ..write('endereco: $endereco, ')
          ..write('cidade: $cidade, ')
          ..write('lat: $lat, ')
          ..write('long: $long, ')
          ..write('horario: $horario, ')
          ..write('emergencial: $emergencial, ')
          ..write('status: $status, ')
          ..write('action: $action')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    evidenciaId,
    idRota,
    idFiscal,
    temaFiscalizacao,
    subTemaFiscalizacao,
    identificacao,
    alimentador,
    descricao,
    image,
    endereco,
    cidade,
    lat,
    long,
    horario,
    emergencial,
    status,
    action,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EvidenciastableData &&
          other.evidenciaId == this.evidenciaId &&
          other.idRota == this.idRota &&
          other.idFiscal == this.idFiscal &&
          other.temaFiscalizacao == this.temaFiscalizacao &&
          other.subTemaFiscalizacao == this.subTemaFiscalizacao &&
          other.identificacao == this.identificacao &&
          other.alimentador == this.alimentador &&
          other.descricao == this.descricao &&
          other.image == this.image &&
          other.endereco == this.endereco &&
          other.cidade == this.cidade &&
          other.lat == this.lat &&
          other.long == this.long &&
          other.horario == this.horario &&
          other.emergencial == this.emergencial &&
          other.status == this.status &&
          other.action == this.action);
}

class EvidenciastableCompanion extends UpdateCompanion<EvidenciastableData> {
  final Value<String> evidenciaId;
  final Value<String> idRota;
  final Value<int?> idFiscal;
  final Value<int?> temaFiscalizacao;
  final Value<String?> subTemaFiscalizacao;
  final Value<String?> identificacao;
  final Value<String?> alimentador;
  final Value<String?> descricao;
  final Value<String?> image;
  final Value<String?> endereco;
  final Value<String?> cidade;
  final Value<double?> lat;
  final Value<double?> long;
  final Value<DateTime?> horario;
  final Value<bool> emergencial;
  final Value<StatusMode> status;
  final Value<SharedMode> action;
  final Value<int> rowid;
  const EvidenciastableCompanion({
    this.evidenciaId = const Value.absent(),
    this.idRota = const Value.absent(),
    this.idFiscal = const Value.absent(),
    this.temaFiscalizacao = const Value.absent(),
    this.subTemaFiscalizacao = const Value.absent(),
    this.identificacao = const Value.absent(),
    this.alimentador = const Value.absent(),
    this.descricao = const Value.absent(),
    this.image = const Value.absent(),
    this.endereco = const Value.absent(),
    this.cidade = const Value.absent(),
    this.lat = const Value.absent(),
    this.long = const Value.absent(),
    this.horario = const Value.absent(),
    this.emergencial = const Value.absent(),
    this.status = const Value.absent(),
    this.action = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EvidenciastableCompanion.insert({
    required String evidenciaId,
    required String idRota,
    this.idFiscal = const Value.absent(),
    this.temaFiscalizacao = const Value.absent(),
    this.subTemaFiscalizacao = const Value.absent(),
    this.identificacao = const Value.absent(),
    this.alimentador = const Value.absent(),
    this.descricao = const Value.absent(),
    this.image = const Value.absent(),
    this.endereco = const Value.absent(),
    this.cidade = const Value.absent(),
    this.lat = const Value.absent(),
    this.long = const Value.absent(),
    this.horario = const Value.absent(),
    this.emergencial = const Value.absent(),
    this.status = const Value.absent(),
    this.action = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : evidenciaId = Value(evidenciaId),
       idRota = Value(idRota);
  static Insertable<EvidenciastableData> custom({
    Expression<String>? evidenciaId,
    Expression<String>? idRota,
    Expression<int>? idFiscal,
    Expression<int>? temaFiscalizacao,
    Expression<String>? subTemaFiscalizacao,
    Expression<String>? identificacao,
    Expression<String>? alimentador,
    Expression<String>? descricao,
    Expression<String>? image,
    Expression<String>? endereco,
    Expression<String>? cidade,
    Expression<double>? lat,
    Expression<double>? long,
    Expression<DateTime>? horario,
    Expression<bool>? emergencial,
    Expression<int>? status,
    Expression<int>? action,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (evidenciaId != null) 'evidencia_id': evidenciaId,
      if (idRota != null) 'id_rota': idRota,
      if (idFiscal != null) 'id_fiscal': idFiscal,
      if (temaFiscalizacao != null) 'tema_fiscalizacao': temaFiscalizacao,
      if (subTemaFiscalizacao != null)
        'sub_tema_fiscalizacao': subTemaFiscalizacao,
      if (identificacao != null) 'identificacao': identificacao,
      if (alimentador != null) 'alimentador': alimentador,
      if (descricao != null) 'descricao': descricao,
      if (image != null) 'image': image,
      if (endereco != null) 'endereco': endereco,
      if (cidade != null) 'cidade': cidade,
      if (lat != null) 'lat': lat,
      if (long != null) 'long': long,
      if (horario != null) 'horario': horario,
      if (emergencial != null) 'emergencial': emergencial,
      if (status != null) 'status': status,
      if (action != null) 'action': action,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EvidenciastableCompanion copyWith({
    Value<String>? evidenciaId,
    Value<String>? idRota,
    Value<int?>? idFiscal,
    Value<int?>? temaFiscalizacao,
    Value<String?>? subTemaFiscalizacao,
    Value<String?>? identificacao,
    Value<String?>? alimentador,
    Value<String?>? descricao,
    Value<String?>? image,
    Value<String?>? endereco,
    Value<String?>? cidade,
    Value<double?>? lat,
    Value<double?>? long,
    Value<DateTime?>? horario,
    Value<bool>? emergencial,
    Value<StatusMode>? status,
    Value<SharedMode>? action,
    Value<int>? rowid,
  }) {
    return EvidenciastableCompanion(
      evidenciaId: evidenciaId ?? this.evidenciaId,
      idRota: idRota ?? this.idRota,
      idFiscal: idFiscal ?? this.idFiscal,
      temaFiscalizacao: temaFiscalizacao ?? this.temaFiscalizacao,
      subTemaFiscalizacao: subTemaFiscalizacao ?? this.subTemaFiscalizacao,
      identificacao: identificacao ?? this.identificacao,
      alimentador: alimentador ?? this.alimentador,
      descricao: descricao ?? this.descricao,
      image: image ?? this.image,
      endereco: endereco ?? this.endereco,
      cidade: cidade ?? this.cidade,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      horario: horario ?? this.horario,
      emergencial: emergencial ?? this.emergencial,
      status: status ?? this.status,
      action: action ?? this.action,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (evidenciaId.present) {
      map['evidencia_id'] = Variable<String>(evidenciaId.value);
    }
    if (idRota.present) {
      map['id_rota'] = Variable<String>(idRota.value);
    }
    if (idFiscal.present) {
      map['id_fiscal'] = Variable<int>(idFiscal.value);
    }
    if (temaFiscalizacao.present) {
      map['tema_fiscalizacao'] = Variable<int>(temaFiscalizacao.value);
    }
    if (subTemaFiscalizacao.present) {
      map['sub_tema_fiscalizacao'] = Variable<String>(
        subTemaFiscalizacao.value,
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
    if (cidade.present) {
      map['cidade'] = Variable<String>(cidade.value);
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
    if (emergencial.present) {
      map['emergencial'] = Variable<bool>(emergencial.value);
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EvidenciastableCompanion(')
          ..write('evidenciaId: $evidenciaId, ')
          ..write('idRota: $idRota, ')
          ..write('idFiscal: $idFiscal, ')
          ..write('temaFiscalizacao: $temaFiscalizacao, ')
          ..write('subTemaFiscalizacao: $subTemaFiscalizacao, ')
          ..write('identificacao: $identificacao, ')
          ..write('alimentador: $alimentador, ')
          ..write('descricao: $descricao, ')
          ..write('image: $image, ')
          ..write('endereco: $endereco, ')
          ..write('cidade: $cidade, ')
          ..write('lat: $lat, ')
          ..write('long: $long, ')
          ..write('horario: $horario, ')
          ..write('emergencial: $emergencial, ')
          ..write('status: $status, ')
          ..write('action: $action, ')
          ..write('rowid: $rowid')
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
  late final GeneratedColumn<String> idRota = GeneratedColumn<String>(
    'id_rota',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  late final GeneratedColumnWithTypeConverter<Conc, int> conc =
      GeneratedColumn<int>(
        'conc',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      ).withConverter<Conc>($RotastableTable.$converterconc);
  static const VerificationMeta _kmMeta = const VerificationMeta('km');
  @override
  late final GeneratedColumn<double> km = GeneratedColumn<double>(
    'km',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    idRota,
    nomeRota,
    alimentador,
    dataInicio,
    conc,
    km,
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
    } else if (isInserting) {
      context.missing(_idRotaMeta);
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
    if (data.containsKey('km')) {
      context.handle(_kmMeta, km.isAcceptableOrUnknown(data['km']!, _kmMeta));
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
        DriftSqlType.string,
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
      conc: $RotastableTable.$converterconc.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}conc'],
        )!,
      ),
      km: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}km'],
      ),
    );
  }

  @override
  $RotastableTable createAlias(String alias) {
    return $RotastableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Conc, int, int> $converterconc =
      const EnumIndexConverter<Conc>(Conc.values);
}

class RotastableData extends DataClass implements Insertable<RotastableData> {
  final String idRota;
  final String nomeRota;
  final String alimentador;
  final String dataInicio;
  final Conc conc;
  final double? km;
  const RotastableData({
    required this.idRota,
    required this.nomeRota,
    required this.alimentador,
    required this.dataInicio,
    required this.conc,
    this.km,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_rota'] = Variable<String>(idRota);
    map['nome_rota'] = Variable<String>(nomeRota);
    map['alimentador'] = Variable<String>(alimentador);
    map['data_inicio'] = Variable<String>(dataInicio);
    {
      map['conc'] = Variable<int>($RotastableTable.$converterconc.toSql(conc));
    }
    if (!nullToAbsent || km != null) {
      map['km'] = Variable<double>(km);
    }
    return map;
  }

  RotastableCompanion toCompanion(bool nullToAbsent) {
    return RotastableCompanion(
      idRota: Value(idRota),
      nomeRota: Value(nomeRota),
      alimentador: Value(alimentador),
      dataInicio: Value(dataInicio),
      conc: Value(conc),
      km: km == null && nullToAbsent ? const Value.absent() : Value(km),
    );
  }

  factory RotastableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RotastableData(
      idRota: serializer.fromJson<String>(json['idRota']),
      nomeRota: serializer.fromJson<String>(json['nomeRota']),
      alimentador: serializer.fromJson<String>(json['alimentador']),
      dataInicio: serializer.fromJson<String>(json['dataInicio']),
      conc: $RotastableTable.$converterconc.fromJson(
        serializer.fromJson<int>(json['conc']),
      ),
      km: serializer.fromJson<double?>(json['km']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idRota': serializer.toJson<String>(idRota),
      'nomeRota': serializer.toJson<String>(nomeRota),
      'alimentador': serializer.toJson<String>(alimentador),
      'dataInicio': serializer.toJson<String>(dataInicio),
      'conc': serializer.toJson<int>(
        $RotastableTable.$converterconc.toJson(conc),
      ),
      'km': serializer.toJson<double?>(km),
    };
  }

  RotastableData copyWith({
    String? idRota,
    String? nomeRota,
    String? alimentador,
    String? dataInicio,
    Conc? conc,
    Value<double?> km = const Value.absent(),
  }) => RotastableData(
    idRota: idRota ?? this.idRota,
    nomeRota: nomeRota ?? this.nomeRota,
    alimentador: alimentador ?? this.alimentador,
    dataInicio: dataInicio ?? this.dataInicio,
    conc: conc ?? this.conc,
    km: km.present ? km.value : this.km,
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
      conc: data.conc.present ? data.conc.value : this.conc,
      km: data.km.present ? data.km.value : this.km,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RotastableData(')
          ..write('idRota: $idRota, ')
          ..write('nomeRota: $nomeRota, ')
          ..write('alimentador: $alimentador, ')
          ..write('dataInicio: $dataInicio, ')
          ..write('conc: $conc, ')
          ..write('km: $km')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(idRota, nomeRota, alimentador, dataInicio, conc, km);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RotastableData &&
          other.idRota == this.idRota &&
          other.nomeRota == this.nomeRota &&
          other.alimentador == this.alimentador &&
          other.dataInicio == this.dataInicio &&
          other.conc == this.conc &&
          other.km == this.km);
}

class RotastableCompanion extends UpdateCompanion<RotastableData> {
  final Value<String> idRota;
  final Value<String> nomeRota;
  final Value<String> alimentador;
  final Value<String> dataInicio;
  final Value<Conc> conc;
  final Value<double?> km;
  final Value<int> rowid;
  const RotastableCompanion({
    this.idRota = const Value.absent(),
    this.nomeRota = const Value.absent(),
    this.alimentador = const Value.absent(),
    this.dataInicio = const Value.absent(),
    this.conc = const Value.absent(),
    this.km = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RotastableCompanion.insert({
    required String idRota,
    required String nomeRota,
    required String alimentador,
    required String dataInicio,
    this.conc = const Value.absent(),
    this.km = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : idRota = Value(idRota),
       nomeRota = Value(nomeRota),
       alimentador = Value(alimentador),
       dataInicio = Value(dataInicio);
  static Insertable<RotastableData> custom({
    Expression<String>? idRota,
    Expression<String>? nomeRota,
    Expression<String>? alimentador,
    Expression<String>? dataInicio,
    Expression<int>? conc,
    Expression<double>? km,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idRota != null) 'id_rota': idRota,
      if (nomeRota != null) 'nome_rota': nomeRota,
      if (alimentador != null) 'alimentador': alimentador,
      if (dataInicio != null) 'data_inicio': dataInicio,
      if (conc != null) 'conc': conc,
      if (km != null) 'km': km,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RotastableCompanion copyWith({
    Value<String>? idRota,
    Value<String>? nomeRota,
    Value<String>? alimentador,
    Value<String>? dataInicio,
    Value<Conc>? conc,
    Value<double?>? km,
    Value<int>? rowid,
  }) {
    return RotastableCompanion(
      idRota: idRota ?? this.idRota,
      nomeRota: nomeRota ?? this.nomeRota,
      alimentador: alimentador ?? this.alimentador,
      dataInicio: dataInicio ?? this.dataInicio,
      conc: conc ?? this.conc,
      km: km ?? this.km,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idRota.present) {
      map['id_rota'] = Variable<String>(idRota.value);
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
    if (conc.present) {
      map['conc'] = Variable<int>(
        $RotastableTable.$converterconc.toSql(conc.value),
      );
    }
    if (km.present) {
      map['km'] = Variable<double>(km.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RotastableCompanion(')
          ..write('idRota: $idRota, ')
          ..write('nomeRota: $nomeRota, ')
          ..write('alimentador: $alimentador, ')
          ..write('dataInicio: $dataInicio, ')
          ..write('conc: $conc, ')
          ..write('km: $km, ')
          ..write('rowid: $rowid')
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
      required String evidenciaId,
      required String idRota,
      Value<int?> idFiscal,
      Value<int?> temaFiscalizacao,
      Value<String?> subTemaFiscalizacao,
      Value<String?> identificacao,
      Value<String?> alimentador,
      Value<String?> descricao,
      Value<String?> image,
      Value<String?> endereco,
      Value<String?> cidade,
      Value<double?> lat,
      Value<double?> long,
      Value<DateTime?> horario,
      Value<bool> emergencial,
      Value<StatusMode> status,
      Value<SharedMode> action,
      Value<int> rowid,
    });
typedef $$EvidenciastableTableUpdateCompanionBuilder =
    EvidenciastableCompanion Function({
      Value<String> evidenciaId,
      Value<String> idRota,
      Value<int?> idFiscal,
      Value<int?> temaFiscalizacao,
      Value<String?> subTemaFiscalizacao,
      Value<String?> identificacao,
      Value<String?> alimentador,
      Value<String?> descricao,
      Value<String?> image,
      Value<String?> endereco,
      Value<String?> cidade,
      Value<double?> lat,
      Value<double?> long,
      Value<DateTime?> horario,
      Value<bool> emergencial,
      Value<StatusMode> status,
      Value<SharedMode> action,
      Value<int> rowid,
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
  ColumnFilters<String> get evidenciaId => $composableBuilder(
    column: $table.evidenciaId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idRota => $composableBuilder(
    column: $table.idRota,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get idFiscal => $composableBuilder(
    column: $table.idFiscal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get temaFiscalizacao => $composableBuilder(
    column: $table.temaFiscalizacao,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subTemaFiscalizacao => $composableBuilder(
    column: $table.subTemaFiscalizacao,
    builder: (column) => ColumnFilters(column),
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

  ColumnFilters<String> get cidade => $composableBuilder(
    column: $table.cidade,
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

  ColumnFilters<bool> get emergencial => $composableBuilder(
    column: $table.emergencial,
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
  ColumnOrderings<String> get evidenciaId => $composableBuilder(
    column: $table.evidenciaId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idRota => $composableBuilder(
    column: $table.idRota,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get idFiscal => $composableBuilder(
    column: $table.idFiscal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get temaFiscalizacao => $composableBuilder(
    column: $table.temaFiscalizacao,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subTemaFiscalizacao => $composableBuilder(
    column: $table.subTemaFiscalizacao,
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

  ColumnOrderings<String> get cidade => $composableBuilder(
    column: $table.cidade,
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

  ColumnOrderings<bool> get emergencial => $composableBuilder(
    column: $table.emergencial,
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
  GeneratedColumn<String> get evidenciaId => $composableBuilder(
    column: $table.evidenciaId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get idRota =>
      $composableBuilder(column: $table.idRota, builder: (column) => column);

  GeneratedColumn<int> get idFiscal =>
      $composableBuilder(column: $table.idFiscal, builder: (column) => column);

  GeneratedColumn<int> get temaFiscalizacao => $composableBuilder(
    column: $table.temaFiscalizacao,
    builder: (column) => column,
  );

  GeneratedColumn<String> get subTemaFiscalizacao => $composableBuilder(
    column: $table.subTemaFiscalizacao,
    builder: (column) => column,
  );

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

  GeneratedColumn<String> get cidade =>
      $composableBuilder(column: $table.cidade, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get long =>
      $composableBuilder(column: $table.long, builder: (column) => column);

  GeneratedColumn<DateTime> get horario =>
      $composableBuilder(column: $table.horario, builder: (column) => column);

  GeneratedColumn<bool> get emergencial => $composableBuilder(
    column: $table.emergencial,
    builder: (column) => column,
  );

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
                Value<String> evidenciaId = const Value.absent(),
                Value<String> idRota = const Value.absent(),
                Value<int?> idFiscal = const Value.absent(),
                Value<int?> temaFiscalizacao = const Value.absent(),
                Value<String?> subTemaFiscalizacao = const Value.absent(),
                Value<String?> identificacao = const Value.absent(),
                Value<String?> alimentador = const Value.absent(),
                Value<String?> descricao = const Value.absent(),
                Value<String?> image = const Value.absent(),
                Value<String?> endereco = const Value.absent(),
                Value<String?> cidade = const Value.absent(),
                Value<double?> lat = const Value.absent(),
                Value<double?> long = const Value.absent(),
                Value<DateTime?> horario = const Value.absent(),
                Value<bool> emergencial = const Value.absent(),
                Value<StatusMode> status = const Value.absent(),
                Value<SharedMode> action = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EvidenciastableCompanion(
                evidenciaId: evidenciaId,
                idRota: idRota,
                idFiscal: idFiscal,
                temaFiscalizacao: temaFiscalizacao,
                subTemaFiscalizacao: subTemaFiscalizacao,
                identificacao: identificacao,
                alimentador: alimentador,
                descricao: descricao,
                image: image,
                endereco: endereco,
                cidade: cidade,
                lat: lat,
                long: long,
                horario: horario,
                emergencial: emergencial,
                status: status,
                action: action,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String evidenciaId,
                required String idRota,
                Value<int?> idFiscal = const Value.absent(),
                Value<int?> temaFiscalizacao = const Value.absent(),
                Value<String?> subTemaFiscalizacao = const Value.absent(),
                Value<String?> identificacao = const Value.absent(),
                Value<String?> alimentador = const Value.absent(),
                Value<String?> descricao = const Value.absent(),
                Value<String?> image = const Value.absent(),
                Value<String?> endereco = const Value.absent(),
                Value<String?> cidade = const Value.absent(),
                Value<double?> lat = const Value.absent(),
                Value<double?> long = const Value.absent(),
                Value<DateTime?> horario = const Value.absent(),
                Value<bool> emergencial = const Value.absent(),
                Value<StatusMode> status = const Value.absent(),
                Value<SharedMode> action = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EvidenciastableCompanion.insert(
                evidenciaId: evidenciaId,
                idRota: idRota,
                idFiscal: idFiscal,
                temaFiscalizacao: temaFiscalizacao,
                subTemaFiscalizacao: subTemaFiscalizacao,
                identificacao: identificacao,
                alimentador: alimentador,
                descricao: descricao,
                image: image,
                endereco: endereco,
                cidade: cidade,
                lat: lat,
                long: long,
                horario: horario,
                emergencial: emergencial,
                status: status,
                action: action,
                rowid: rowid,
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
      required String idRota,
      required String nomeRota,
      required String alimentador,
      required String dataInicio,
      Value<Conc> conc,
      Value<double?> km,
      Value<int> rowid,
    });
typedef $$RotastableTableUpdateCompanionBuilder =
    RotastableCompanion Function({
      Value<String> idRota,
      Value<String> nomeRota,
      Value<String> alimentador,
      Value<String> dataInicio,
      Value<Conc> conc,
      Value<double?> km,
      Value<int> rowid,
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
  ColumnFilters<String> get idRota => $composableBuilder(
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

  ColumnWithTypeConverterFilters<Conc, Conc, int> get conc =>
      $composableBuilder(
        column: $table.conc,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<double> get km => $composableBuilder(
    column: $table.km,
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
  ColumnOrderings<String> get idRota => $composableBuilder(
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

  ColumnOrderings<int> get conc => $composableBuilder(
    column: $table.conc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get km => $composableBuilder(
    column: $table.km,
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
  GeneratedColumn<String> get idRota =>
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

  GeneratedColumnWithTypeConverter<Conc, int> get conc =>
      $composableBuilder(column: $table.conc, builder: (column) => column);

  GeneratedColumn<double> get km =>
      $composableBuilder(column: $table.km, builder: (column) => column);
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
                Value<String> idRota = const Value.absent(),
                Value<String> nomeRota = const Value.absent(),
                Value<String> alimentador = const Value.absent(),
                Value<String> dataInicio = const Value.absent(),
                Value<Conc> conc = const Value.absent(),
                Value<double?> km = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RotastableCompanion(
                idRota: idRota,
                nomeRota: nomeRota,
                alimentador: alimentador,
                dataInicio: dataInicio,
                conc: conc,
                km: km,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String idRota,
                required String nomeRota,
                required String alimentador,
                required String dataInicio,
                Value<Conc> conc = const Value.absent(),
                Value<double?> km = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RotastableCompanion.insert(
                idRota: idRota,
                nomeRota: nomeRota,
                alimentador: alimentador,
                dataInicio: dataInicio,
                conc: conc,
                km: km,
                rowid: rowid,
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
