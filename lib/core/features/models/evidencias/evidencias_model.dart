import 'package:monitoramento/app/shared/enums/enumFiscalizacao.dart';

class EvidenciaModel {
  final String evidenciaRotaId;
  final int rotaId;
  final String fiscal;
  final String? alimentador;
  final String? identificacao;
  final String? descricao;
  final List<String> imageURL;
  final List<String> mediumImageUrl;
  final List<String> lowImageUrl;
  final String endereco;
  final double latitude;
  final double longitude;
  final DateTime horario;
  final TipoConstatacao temaFiscalizacao;

  EvidenciaModel({
    required this.evidenciaRotaId,
    required this.rotaId,
    required this.fiscal,
    required this.temaFiscalizacao,
    required this.alimentador,
    required this.identificacao,
    required this.descricao,
    required this.imageURL,
    required this.mediumImageUrl,
    required this.lowImageUrl,
    required this.endereco,
    required this.horario,
    required this.latitude,
    required this.longitude,
  });

  // Converte JSON da API para objeto Dart
  factory EvidenciaModel.fromJson(Map<String, dynamic> json) {
    return EvidenciaModel(
      evidenciaRotaId: json['evidenciaRotaId'],
      rotaId: json['rotaId'],
      fiscal: json['nomeFiscal'],
      temaFiscalizacao: TipoConstatacao.values[json['temaFiscalizacao']],
      alimentador: json['alimentador'],
      identificacao: json['identificacao'],
      descricao: json['descricao'],
      imageURL: List<String>.from(json['imageURL']),
      mediumImageUrl: List<String>.from(json['mediumImageUrl']),
      lowImageUrl: List<String>.from(json['lowImageUrl']),
      endereco: json['endereco'],
      horario: DateTime.parse(json['horario']),
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
