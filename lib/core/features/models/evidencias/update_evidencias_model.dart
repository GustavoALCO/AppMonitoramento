class UpdateEvidenciasModel {
  final String evidenciaID;
  final String? descricao;
  final int? tema;
  final String? alimentador;
  final String? endereco;
  final String? identificacao;
  final bool? emergencial;

  UpdateEvidenciasModel({
    required this.evidenciaID,
    this.descricao,
    this.tema,
    this.alimentador,
    this.endereco,
    this.identificacao,
    this.emergencial,
  });

  Map<String, dynamic> toJson() {
    return {
      'evidenciaId': evidenciaID,
      if (descricao != null) 'descricao': "$descricao",
      if (tema != null) 'tema': tema,
      if (alimentador != null) 'alimentador': "$alimentador",
      if (endereco != null) 'endereco': "$endereco",
      if (identificacao != null) 'identificacao': "$identificacao",
      if (emergencial != null) 'emergencial': emergencial,
    };
  }
}
