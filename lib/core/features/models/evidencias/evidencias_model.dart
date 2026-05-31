import 'package:monitoramento/app/shared/enums/enumFiscalizacao.dart';
import 'package:monitoramento/app/shared/enums/enumTemaFiscalicacao.dart';

class EvidenciaModel {
  final String evidenciaRotaId;
  final String rotaId;
  final String fiscal;
  final String? alimentador;
  final String? identificacao;
  final String? descricao;
  final bool emergencial;
  final List<String> imageURL;
  final List<String> lowImageUrl;
  final String endereco;
  final String? cidade;
  final double latitude;
  final double longitude;
  final DateTime horario;
  final List<SubTemaFiscalizacao> subTemaFiscalizacao;
  final TemaFiscalizacao temaFiscalizacao;

  EvidenciaModel({
    required this.evidenciaRotaId,
    required this.rotaId,
    required this.fiscal,
    required this.temaFiscalizacao,
    required this.subTemaFiscalizacao,
    required this.alimentador,
    required this.identificacao,
    required this.descricao,
    required this.emergencial,
    required this.imageURL,
    required this.lowImageUrl,
    required this.endereco,
    this.cidade,
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
      temaFiscalizacao: TemaFiscalizacao.values[json['temaFiscalizacao']],
      subTemaFiscalizacao: (json['subTemaFiscalizacao'] as List)
          .map((e) => SubTemaFiscalizacao.values[e as int])
          .toList(),
      alimentador: json['alimentador'],
      identificacao: json['identificacao'],
      descricao: json['descricao'],
      imageURL: List<String>.from(json['imageURL']),
      lowImageUrl: List<String>.from(json['lowImageUrl']),
      endereco: json['endereco'],
      cidade: json['cidade'],
      horario: DateTime.parse(json['horario']),
      latitude: json['latitude'],
      longitude: json['longitude'],
      emergencial: json['emergencial']
    );
  }
}
