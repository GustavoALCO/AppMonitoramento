import 'package:monitoramento/app/shared/enums/enumConc.dart';

class RotasModel {
  // Declarando os atributos da classe
  final String id;
  final String nome;
  final String alimentador;
  final Conc conc;
  final double? km;
  final String dataInicio;
  final String? dataFinal;

    // Construtor da classe
  RotasModel({
    required this.id,
    required this.nome,
    required this.alimentador,
    required this.conc,
    this.km,
    required this.dataInicio,
    this.dataFinal,
  });

  // Método de fábrica para criar uma instância de RotasModel a partir de um JSON
  factory RotasModel.fromJson(Map<String, dynamic> json) {
    return RotasModel(
      id: json['rotaId'],
      nome: json['nomeRota'] ?? "Rota sem nome",
      alimentador: json['alimentador'] ?? "Alimentador não informado",
      conc: Conc.values[json['concessionarias'] ?? 0],
      km: json['km'] as double?,  
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