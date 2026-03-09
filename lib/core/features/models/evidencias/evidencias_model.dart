import 'package:monitoramento/app/shared/enums/enumFiscalizacao.dart';

class EvidenciaModel {
  final int evidenciaRotaId;
  final int rotaId;
  final String fiscal;
  final String? alimentador;
  final String? identificacao;
  final String? descricao;
  final String imageURL;
  final String endereco;
  final String cep;
  final double latitude;
  final double longitude;
  final String horario;
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
    required this.endereco,
    required this.cep,
    required this.horario,
    required this.latitude,
    required this.longitude
  });

  // Converte JSON da API para objeto Dart
  factory EvidenciaModel.fromJson(Map<String, dynamic> json) {
    return EvidenciaModel(
      evidenciaRotaId: json['evidenciaRotaId'],
      rotaId: json['rotaId'],
      fiscal: json['nomeFiscal'],
      temaFiscalizacao: TipoConstatacao.values[ json['temaFiscalizacao']],
      alimentador: json['alimentador'],
      identificacao: json['identificacao'],
      descricao: json['descricao'],
      imageURL: json['imageURL'],
      endereco: json['endereco'],
      cep: json['cep'],
      horario: json['horario'],
      latitude: json['latitude'],
      longitude: json['longitude']
    );
  }

  // Converte objeto Dart em JSON para enviar ao backend
  Map<String, dynamic> toJson() {
    return {
      'evidenciaRotaId': evidenciaRotaId,
      'fiscal': fiscal,
      'rotaId': rotaId,
      'temaFiscalizacao': temaFiscalizacao.toString().split('.').last,
      'alimentador': alimentador,
      'identificacao': identificacao,
      'descricao': descricao,
      'imageURL': imageURL,
      'endereco': endereco,
      'cep': cep,
      'horario': horario,
      'latidude': latitude,
      'longitude': longitude
    };
  }
}