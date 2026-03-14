import 'package:monitoramento/app/shared/enums/enumFiscalizacao.dart';
import 'package:monitoramento/app/shared/enums/enumStatusMode.dart';

class EvidenciaCardDto {
  final int id;
  final int rotaId;
  final String fiscal;
  final String? descricao;
  final String endereco;
  final String? identificacao;
  final String? alimentador;
  final String image;
  final String horario;
  final double latitude;
  final double longitude;
  final TipoConstatacao tema;
  final StatusMode status;

  EvidenciaCardDto({
    required this.id,
    required this.rotaId,
    required this.fiscal,
    required this.descricao,
    required this.endereco,
    required this.identificacao,
    required this.alimentador,
    required this.image,
    required this.horario,
    required this.latitude,
    required this.longitude,
    required this.tema,
    required this.status,
  });
}