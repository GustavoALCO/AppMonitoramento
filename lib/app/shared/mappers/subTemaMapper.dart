import 'package:monitoramento/app/shared/enums/enumFiscalizacao.dart';
import 'package:monitoramento/app/shared/model/selectItem.dart';

class Subtemamapper 
{
  static final List<Selectitem> temas = 
  [
    // ======================
    // TEMAS DE POSTE
    // ======================
    Selectitem(
      id: SubTemaFiscalizacao.estadoFisico.index,
      titulo: 'Estado físico (trincas, apodrecimento, corrosão, empenamento)',
    ),
    Selectitem(
      id: SubTemaFiscalizacao.estabilidadeEAlinhamento.index,
      titulo: 'Estabilidade e Alinhamento',
    ),
    Selectitem(
      id: SubTemaFiscalizacao.identificacaoLegivel.index,
      titulo: 'Identificação Legível',
    ),
    Selectitem(
      id: SubTemaFiscalizacao.sinaisDeColisaoImpacto.index,
      titulo: 'Sinais de Colisão ou Impacto',
    ),
    Selectitem(
      id: SubTemaFiscalizacao.condicoesDaBase.index,
      titulo: 'Condições da base (exposição, erosão)',
    ),

    // ======================
    // TEMAS DE COMPARTILHAMENTO
    // ======================
    Selectitem(
      id: SubTemaFiscalizacao.posicionamentoCorretoDosCabos.index,
      titulo: 'Posicionamento dos cabos abaixo da rede elétrica',
    ),
    Selectitem  (
      id: SubTemaFiscalizacao.afastamentoMinimo.index,
      titulo: 'Afastamento minimo',
    ),
    Selectitem(
      id: SubTemaFiscalizacao.ausenciaDeCabosSoltos.index,
      titulo: 'Cabos soltos, rompidos ou apoiados em ferragens elétricas',
    ),
    Selectitem  (
      id: SubTemaFiscalizacao.fixacaoAdequada.index,
      titulo: 'Fixação de caixas',
    ),
    Selectitem(
      id: SubTemaFiscalizacao.identificacaoResponsavel.index,
      titulo: 'Identificação do responsável pelo cabo',
    ),
    Selectitem(
      id: SubTemaFiscalizacao.ocupacaoClandestina.index,
      titulo: 'ocupação clandestina',
    ),
    Selectitem(
      id: SubTemaFiscalizacao.organizacaoDoFeixeDeCabosNoPoste.index,
      titulo: 'Organização do feixe de cabos no poste',
    ),

    // ======================
    // TEMAS DE ESTRUTURAS/FERRAGENS
    // ======================
    Selectitem(
      id: SubTemaFiscalizacao.integridadeCruzetasSuportes.index,
      titulo: 'Integridade de cruzetas, suportes',
    ),
    Selectitem(
      id: SubTemaFiscalizacao.apertoDePorcasEParafusos.index,
      titulo: 'Aperto de porcas e parafusos',
      ),
    Selectitem(
      id: SubTemaFiscalizacao.corrosaoDesgaste.index,
      titulo: 'Corrosão ou desgaste',
    ),

    // ======================
    // TEMAS DE ISOLADORES
    // ======================
    Selectitem(
      id: SubTemaFiscalizacao.trincasQuebras.index,
      titulo: 'Trincas, Quebras ou Fuligem',
    ),
    Selectitem(
      id: SubTemaFiscalizacao.fixacaoCruzeta.index,
      titulo: 'Fixação na cruzetas',
    ),

    // ======================
    // TEMAS DE CONDUTORES
    // ======================
    Selectitem(
      id: SubTemaFiscalizacao.estadoFisicoDesgaste.index,
      titulo: 'Estado físico (desgaste, emendas irregulares)'
    ),
    Selectitem(
      id: SubTemaFiscalizacao.tensaoMecanicaAdequada.index,
      titulo: 'Tensão mecânica'
    ),
    Selectitem(
      id: SubTemaFiscalizacao.afastamentoEstruturas.index,
      titulo: 'Afastamento de árvores ou estruturas',
    ),

    // ======================
    // TEMAS DE ATERRAMENTO
    // ======================
    Selectitem(
      id: SubTemaFiscalizacao.presencaEstado.index,
      titulo: 'Estado do fio de aterramento',
    ),
    Selectitem(
      id: SubTemaFiscalizacao.conexoesCorretas.index,
      titulo: 'Conexões incorretas ou ausentes',
    ),

    // ======================
    // TEMAS DE TRANSFORMADORES
    // ======================
    Selectitem(
      id: SubTemaFiscalizacao.vazamentoCorrosao.index,
      titulo: 'Vazamento ou corrosão, Pintura',
    ),
    Selectitem(
      id: SubTemaFiscalizacao.nivelOleo.index,
      titulo: 'Nível de óleo/visores',
    ),
    Selectitem(
      id: SubTemaFiscalizacao.estadoBuchas.index,
      titulo: 'Estado das buchas',
    ),
    Selectitem(
      id: SubTemaFiscalizacao.paraRaios.index,
      titulo: 'Para-raios'
    ),

    // ======================
    // TEMAS DE CHAVES/RELIGADORES
    // ======================
    Selectitem(
      id: SubTemaFiscalizacao.integridadeFisica.index,
      titulo: 'Integridade física, ausência de fuligem'
    ),
    Selectitem(
      id: SubTemaFiscalizacao.contatosManobrabilidade.index,
      titulo: 'Contatos, manobrabilidade'
    ),
    Selectitem(
      id: SubTemaFiscalizacao.sinalizacaoPosicao.index,
      titulo: 'Sinalização de posição'
    ),

    // ======================
    // TEMAS DE PARA-RAIOS
    // ======================
    Selectitem(
      id: SubTemaFiscalizacao.fixacaoCorreta.index, 
      titulo: 'Fixação incorreta ou ausente'
    ),
    Selectitem(
      id: SubTemaFiscalizacao.trincasQueimaduras.index,
      titulo: 'Trincas, queimaduras, fuligem'
    ),
    Selectitem(
      id: SubTemaFiscalizacao.conexaoAterramento.index,
      titulo: 'Conexão do aterramento'
    ),

     // ======================
    // TEMAS DE ILUMINAÇÃO PÚBLICA
    // ======================
    Selectitem(
      id: SubTemaFiscalizacao.estadoLuminaria.index, 
      titulo: 'Estado da luminária'
      ),
    Selectitem(
      id: SubTemaFiscalizacao.funcionamentoLampada.index,
      titulo: 'Funcionamento da lâmpada'
    ),
    Selectitem(
      id: SubTemaFiscalizacao.fotocelulaOperacao.index,
      titulo: 'Fotocélula'
    ),
    Selectitem(
      id: SubTemaFiscalizacao.fiacaoExposta.index, 
      titulo: 'Fiação exposta ou mal fixada'
    ),

    // ======================
    // TEMAS DE VEGETAÇÃO
    // ======================
    Selectitem(
      id: SubTemaFiscalizacao.galhosProximos.index,
      titulo: 'Galhos próximos à rede'
    ),
    Selectitem(
      id: SubTemaFiscalizacao.riscoDeQueda.index, 
      titulo: 'Risco de queda de árvores'
      ),

    // ======================
    // TEMAS DE SEGURANÇA/SINALIZAÇÃO
    // ======================

    Selectitem(
      id: SubTemaFiscalizacao.placasAdvertenciaVisiveis.index, 
      titulo: 'Placas de advertência'
    ),
    Selectitem(
      id: SubTemaFiscalizacao.barreirasAdequadas.index, 
      titulo: "Barreiras de proteção"
    ),
    Selectitem(
      id: SubTemaFiscalizacao.conformidadeNormas.index,
      titulo: "inconformidade com normas (NR-10, concessionária)"
    ),

    // ======================
    // OUTROS
    // ======================
    Selectitem(id: SubTemaFiscalizacao.outros.index, 
    titulo: "Outros"
    )
  ];

  static Selectitem? obterTema(int id) {

    try {

      return temas.firstWhere(
        (x) => x.id == id,
      );

    } catch (_) {

      return null;
    }
  }
}