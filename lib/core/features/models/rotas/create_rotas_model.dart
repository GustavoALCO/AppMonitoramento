
class CreateRotasModel {
  final String? idRota;
  final String nome;
  final int conc;
  final List<int> idFiscal;
  final String alimentador;
  final DateTime dataInicio;

  CreateRotasModel({
    required this.idRota,
    required this.nome,
    required this.conc,
    required this.idFiscal,
    required this.alimentador,
    required this.dataInicio,
  });

  Map<String, dynamic> toJson() {
    return {
      'idRota': idRota,
      'nomeRota': nome,
      'concessionarias': conc,
      'fiscais': idFiscal,
      'alimentador': alimentador,
      'dataInicio': dataInicio.toIso8601String(),
    };
  }
}