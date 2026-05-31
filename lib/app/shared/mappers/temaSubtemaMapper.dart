import 'package:monitoramento/app/shared/enums/enumFiscalizacao.dart';
import 'package:monitoramento/app/shared/enums/enumTemaFiscalicacao.dart';

class TemaSubtemaMapper 
{
  static final Map<TemaFiscalizacao,
      List<SubTemaFiscalizacao>> regras =
      {
        TemaFiscalizacao.Postes: [
          SubTemaFiscalizacao.estadoFisico,
          SubTemaFiscalizacao.estabilidadeEAlinhamento,
          SubTemaFiscalizacao.identificacaoLegivel,
          SubTemaFiscalizacao.sinaisDeColisaoImpacto,
          SubTemaFiscalizacao.condicoesDaBase
        ],

        TemaFiscalizacao.Compartilhamento: [
          SubTemaFiscalizacao.posicionamentoCorretoDosCabos,
          SubTemaFiscalizacao.afastamentoMinimo,
          SubTemaFiscalizacao.ausenciaDeCabosSoltos,
          SubTemaFiscalizacao.fixacaoAdequada,
          SubTemaFiscalizacao.identificacaoResponsavel,
          SubTemaFiscalizacao.ocupacaoClandestina,
          SubTemaFiscalizacao.organizacaoDoFeixeDeCabosNoPoste
        ],

        TemaFiscalizacao.EstruturasFerragens: [
          SubTemaFiscalizacao.integridadeCruzetasSuportes,
          SubTemaFiscalizacao.apertoDePorcasEParafusos,
          SubTemaFiscalizacao.corrosaoDesgaste
        ],

        TemaFiscalizacao.Isoladores: [
          SubTemaFiscalizacao.trincasQuebras,
          SubTemaFiscalizacao.fixacaoCruzeta
        ],

        TemaFiscalizacao.Condutores: [
          SubTemaFiscalizacao.estadoFisicoDesgaste,
          SubTemaFiscalizacao.tensaoMecanicaAdequada,
          SubTemaFiscalizacao.afastamentoEstruturas
        ],

        TemaFiscalizacao.Aterramento: [
          SubTemaFiscalizacao.presencaEstado,
          SubTemaFiscalizacao.conexoesCorretas
        ],

        TemaFiscalizacao.Transformadores: [
          SubTemaFiscalizacao.vazamentoCorrosao,
          SubTemaFiscalizacao.nivelOleo,
          SubTemaFiscalizacao.estadoBuchas,
          SubTemaFiscalizacao.paraRaios
        ],

        TemaFiscalizacao.ChavesReligadores: [
          SubTemaFiscalizacao.integridadeFisica,
          SubTemaFiscalizacao.contatosManobrabilidade,
          SubTemaFiscalizacao.sinalizacaoPosicao
        ],

        TemaFiscalizacao.ParaRaios: [
          SubTemaFiscalizacao.fixacaoCorreta,
          SubTemaFiscalizacao.trincasQueimaduras,
          SubTemaFiscalizacao.conexaoAterramento
        ],

        TemaFiscalizacao.IluminacaoPublica: [
          SubTemaFiscalizacao.estadoLuminaria,
          SubTemaFiscalizacao.funcionamentoLampada,
          SubTemaFiscalizacao.fotocelulaOperacao,
          SubTemaFiscalizacao.fiacaoExposta
        ],

        TemaFiscalizacao.Vegetacao: [
          SubTemaFiscalizacao.galhosProximos,
          SubTemaFiscalizacao.riscoDeQueda
        ],

        TemaFiscalizacao.Seguranca: [
          SubTemaFiscalizacao.placasAdvertenciaVisiveis,
          SubTemaFiscalizacao.barreirasAdequadas,
          SubTemaFiscalizacao.conformidadeNormas
        ],

        TemaFiscalizacao.Outros: [
          SubTemaFiscalizacao.outros
        ]
      };

       static List<SubTemaFiscalizacao>
      obterSubTemas(TemaFiscalizacao tema) {

    return regras[tema] ?? [];
  }
}