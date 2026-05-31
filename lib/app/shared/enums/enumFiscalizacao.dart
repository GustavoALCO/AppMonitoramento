enum SubTemaFiscalizacao {
  // ======================
  // TEMAS DE POSTE
  // ======================

  estadoFisico,
  estabilidadeEAlinhamento,
  identificacaoLegivel,
  sinaisDeColisaoImpacto,
  condicoesDaBase,

  // ======================
  // TEMAS DE COMPARTILHAMENTO
  // ======================

  posicionamentoCorretoDosCabos,
  afastamentoMinimo,
  ausenciaDeCabosSoltos,
  fixacaoAdequada,
  identificacaoResponsavel,
  ocupacaoClandestina,
  organizacaoDoFeixeDeCabosNoPoste,

  // ======================
  // TEMAS DE ESTRUTURAS/FERRAGENS
  // ======================

  integridadeCruzetasSuportes,
  apertoDePorcasEParafusos,
  corrosaoDesgaste,

  // ======================
  // TEMAS DE ISOLADORES
  // ======================

  trincasQuebras,
  fixacaoCruzeta,

  // ======================
  // TEMAS DE CONDUTORES
  // ======================

  estadoFisicoDesgaste,
  tensaoMecanicaAdequada,
  afastamentoEstruturas,

  // ======================
  // TEMAS DE ATERRAMENTO
  // ======================

  presencaEstado,
  conexoesCorretas,

  // ======================
  // TEMAS DE TRANSFORMADORES
  // ======================

  vazamentoCorrosao,
  nivelOleo,
  estadoBuchas,
  paraRaios,

  // ======================
  // TEMAS DE CHAVES/RELIGADORES
  // ======================

  integridadeFisica,
  contatosManobrabilidade,
  sinalizacaoPosicao,

  // ======================
  // TEMAS DE PARA-RAIOS
  // ======================

  fixacaoCorreta,
  trincasQueimaduras,
  conexaoAterramento,

  // ======================
  // TEMAS DE ILUMINAÇÃO PÚBLICA
  // ======================

  estadoLuminaria,
  funcionamentoLampada,
  fotocelulaOperacao,
  fiacaoExposta,

  // ======================
  // TEMAS DE VEGETAÇÃO
  // ======================

  galhosProximos,
  riscoDeQueda,

  // ======================
  // TEMAS DE SEGURANÇA/SINALIZAÇÃO
  // ======================

  placasAdvertenciaVisiveis,
  barreirasAdequadas,
  conformidadeNormas,

  // ======================
  // OUTROS
  // ======================

  outros;
}