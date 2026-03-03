class RotasModel {
  // Declarando os atributos da classe
  final int id;
  final String nome;
  final String alimentador;
  final String dataInicio;
  final String? dataFinal;

    // Construtor da classe
  RotasModel({
    required this.id,
    required this.nome,
    required this.alimentador,
    required this.dataInicio,
    this.dataFinal,
  });

  // Método de fábrica para criar uma instância de RotasModel a partir de um JSON
  factory RotasModel.fromJson(Map<String, dynamic> json) {
    return RotasModel(
      id: json['rotaId'],
      nome: json['nomeRota'] ?? "Rota sem nome",
      alimentador: json['alimentador'] ?? "Alimentador não informado",
      dataInicio: json['dataInicio'] ?? "Data não informada",
      dataFinal: json['dataFinal'],
    );
  }

  // Método para converter uma instância de RotasModel em um JSON
  Map<String, dynamic> toJson() {
    return {
      'rotaId': id,
      'nomeRota': nome,
      'alimentador': alimentador,
      'dataInicio': dataInicio,
      'dataFinal': dataFinal,
    };
  }
}