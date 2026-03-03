class UpdateEvidenciasModel {
  final int id;
  final String? descricao;
  final int? tema;
  final String? alimentador;
  final String? endereco;
  final String? identificacao;

  UpdateEvidenciasModel({
    required this.id,
    this.descricao,
    this.tema,
    this.alimentador,
    this.endereco,
    this.identificacao,
  });

  Map<String, dynamic> toJson() {
    return {
      'evidenciaId': id,
      if (descricao != null) 'descricao': "$descricao",
      if (tema != null) 'tema': tema,
      if (alimentador != null) 'alimentador': "$alimentador",
      if (endereco != null) 'endereco': "$endereco",
      if (identificacao != null) 'identificacao': "$identificacao",

    };
  }
}