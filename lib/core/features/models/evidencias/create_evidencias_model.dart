class CreateEvidenciasModel {
  final String evidenciarotaID;
  final String rotaId;
  final int fiscalId;
  final int tema;
  final List<int> subtema;
  final bool emergencial;
  final String? identificacao;
  final String? alimentador;
  final String? descricao;
  final List<String> base64;
  final String endereco;
  final String cidade;
  final double latitude;
  final double longitude;
  final DateTime dataHora;

  CreateEvidenciasModel({
    required this.evidenciarotaID,
    required this.rotaId,
    required this.fiscalId,
    required this.tema,
    required this.subtema,
    required this.emergencial,
    this.identificacao,
    this.alimentador,
    required this.descricao,
    required this.base64,
    required this.endereco,
    required this.cidade,
    required this.latitude,
    required this.longitude,
    required this.dataHora,
  });

  Map<String, dynamic> toJson() {
    return {
      'evidenciaId': evidenciarotaID,
      'rotaID': rotaId,
      'fiscalId': fiscalId,
      'temaFiscalizacao': tema,
      'subtemaFiscalizacao': subtema,
      'emergencial': emergencial,
      if (identificacao != null) 'identificacao': identificacao,
      if (alimentador != null) 'alimentador': alimentador,
      'descricao': descricao,
      'base64': base64, // agora envia lista
      'endereco': endereco,
      'cidade': cidade,
      'latitude': latitude,
      'longitude': longitude,
      'horario': dataHora.toUtc().toIso8601String(),
    };
  }

  factory CreateEvidenciasModel.fromJson(Map<String, dynamic> json) {
    List<String> imagens = [];

    if (json['base64'] != null) {
      imagens = List<String>.from(json['base64']);
    }

    return CreateEvidenciasModel(
      evidenciarotaID: json['evidenciaId'],
      rotaId: json['rotaID'],
      fiscalId: json['fiscalId'],
      tema: json['temaFiscalizacao'],
      subtema: (json['subTemaFiscalizacao'] as List)
          .map((e) => int.parse(e.toString()))
          .toList(),
      identificacao: json['identificacao'],
      alimentador: json['alimentador'],
      descricao: json['descricao'],
      base64: imagens,
      endereco: json['endereco'],
      cidade: json['cidade'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      dataHora: DateTime.parse(json['horario']),
      emergencial: json['emergencial'],
    );
  }
}
