class CreateEvidenciasModel {
  final String evidenciarotaID;
  final int rotaId;
  final int fiscalId;
  final int tema;
  final String? identificacao;
  final String? alimentador;
  final String? descricao;
  final List<String> base64;
  final String endereco;
  final double latitude;
  final double longitude;
  final DateTime dataHora;

  CreateEvidenciasModel({
    required this.evidenciarotaID,
    required this.rotaId,
    required this.fiscalId,
    required this.tema,
    this.identificacao,
    this.alimentador,
    required this.descricao,
    required this.base64,
    required this.endereco,
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
      if (identificacao != null) 'identificacao': identificacao,
      if (alimentador != null) 'alimentador': alimentador,
      'descricao': descricao,
      'base64': base64, // agora envia lista
      'endereco': endereco,
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
      identificacao: json['identificacao'],
      alimentador: json['alimentador'],
      descricao: json['descricao'],
      base64: imagens,
      endereco: json['endereco'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      dataHora: DateTime.parse(json['horario']),
    );
  }
}
