import 'dart:ffi';

class GetFiltersRotasModel {
  final int id;
  final String? nome;
  final String? alimentador;
  final Double? km;
  final int? conc;
  final int? dataInicio;
  final int? dataFinal;
  final int page;
  final int size;

  GetFiltersRotasModel({
    required this.id,
    this.nome,
    this.alimentador,
    this.km,
    this.conc,
    this.dataInicio,
    this.dataFinal,
    required this.page,
    required this.size,
  });

  // Método para converter o modelo em um mapa JSON
  Map<String, String> toQuery() {
    return {
      'FiscalId': id.toString(),
      if (nome != null && nome!.isNotEmpty) 'nomeRota': nome!,
      if (alimentador != null && alimentador!.isNotEmpty)
        'alimentador': alimentador!,
      if (dataInicio != null) 'dataInicio': dataInicio.toString(),
      if (dataFinal != null) 'dataFinal': dataFinal.toString(),
      'page': page.toString(),
      'pagesize': size.toString(),
    };
  }
}