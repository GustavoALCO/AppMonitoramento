class CreateRotasModel {
  final String nome;
  final String alimentador;
  final DateTime dataInicio;

  CreateRotasModel({
    required this.nome,
    required this.alimentador,
    required this.dataInicio,
  });

  Map<String, dynamic> toJson() {
    return {
      'nomeRota': nome,
      'alimentador': alimentador,
      'dataInicio': dataInicio.toIso8601String(),
    };
  }
}