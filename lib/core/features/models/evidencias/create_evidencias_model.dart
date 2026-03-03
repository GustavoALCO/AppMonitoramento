class CreateEvidenciasModel {
  final int rotaId;
  final int fiscalId;
  final int tema;
  final String? identificacao;
  final String? alimentador;
  final String descricao;
  final String base64;
  final String endereco;
  final String cep;
  final double latitude;
  final double longitude;
  final DateTime dataHora;

  CreateEvidenciasModel({
    required this.rotaId,
    required this.fiscalId,
    required this.tema,
    this.identificacao,
    this.alimentador,
    required this.descricao,
    required this.base64,
    required this.endereco,
    required this.cep,
    required this.latitude,
    required this.longitude,
    required this.dataHora,
  });

  Map<String, dynamic> toJson() {
    return {
      'rotaID': rotaId,
      'fiscalId': fiscalId,
      'temaFiscalizacao': tema,
      if (identificacao != null) 'identificacao': identificacao,
      if (alimentador != null) 'alimentador': alimentador,
      'descricao': descricao,
      'base64': base64,
      'endereco': endereco,
      'cep': cep,
      'latitude': latitude,
      'longitude': longitude,
      'horario': dataHora.toUtc().toIso8601String(),
    };
  }

  factory CreateEvidenciasModel.fromJson(Map<String, dynamic> json) {
    return CreateEvidenciasModel(
      rotaId: json['rotaID'],
      fiscalId: json['fiscalId'],
      tema: json['temaFiscalizacao'],
      identificacao: json['identificacao'],
      alimentador: json['alimentador'],
      descricao: json['descricao'],
      base64: json['base64'],
      endereco: json['endereco'],
      cep: json['cep'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      dataHora: DateTime.parse(json['horario']),
    );
  }

  
}