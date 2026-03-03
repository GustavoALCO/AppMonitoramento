class UpdateRotasModel {
  final int id;
  final String? nome;
  final String? alimentador;

  UpdateRotasModel({
    required this.id,
    this.nome,
    this.alimentador,
  });

  Map<String, dynamic> toJson() {
    return {
      'rotaId': id,
      if (nome != null) 'nomeRota': nome,
      if (alimentador != null) 'alimentador': alimentador,
    };
  }
}