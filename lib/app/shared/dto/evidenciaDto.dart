import 'package:monitoramento/app/shared/enums/enumFiscalizacao.dart';
import 'package:monitoramento/app/shared/enums/enumStatusMode.dart';

class EvidenciaCardDto {
  final String idEvi;
  final String rotaId;
  final String fiscal;
  final String? descricao;
  final String endereco;
  final String cidade;
  final String? identificacao;
  final String? alimentador;
  final List<String>? lowImage;
  final List<String>? mediumImage;
  final List<String> originalImage;
  final String horario;
  final double latitude;
  final double longitude;
  final TipoConstatacao tema;
  final StatusMode status;
  final bool emergencial;

  EvidenciaCardDto({
    required this.idEvi,
    required this.rotaId,
    required this.fiscal,
    required this.descricao,
    required this.endereco,
    required this.cidade,
    required this.identificacao,
    required this.alimentador,
    this.lowImage,
    this.mediumImage,
    required this.originalImage,
    required this.horario,
    required this.latitude,
    required this.longitude,
    required this.tema,
    required this.status,
    required this.emergencial,
  });
}
