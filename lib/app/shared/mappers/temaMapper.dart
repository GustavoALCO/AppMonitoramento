import 'package:monitoramento/app/shared/enums/enumTemaFiscalicacao.dart';
import 'package:monitoramento/app/shared/model/selectItem.dart';

class Temamapper 
{
  static final List<Selectitem> temas = 
  [
    Selectitem(
      id: TemaFiscalizacao.Postes.index,
      titulo: "Postes"
      ),
    Selectitem
    (
      id: TemaFiscalizacao.Aterramento.index,
      titulo: 'Aterramento',
    ),

    Selectitem(
      id: TemaFiscalizacao.Compartilhamento.index,
      titulo: 'Compartilhamento',
    ),
    Selectitem(
      id: TemaFiscalizacao.EstruturasFerragens.index,
      titulo: 'Estruturas e Ferragens',
    ),
    Selectitem(
      id: TemaFiscalizacao.Isoladores.index,
      titulo: 'Isoladores',
    ),
    Selectitem(
      id: TemaFiscalizacao.Condutores.index,
      titulo: 'Condutores',
    ),
    Selectitem(
      id: TemaFiscalizacao.Transformadores.index,
      titulo: 'Transformadores',
    ),
    Selectitem(
      id: TemaFiscalizacao.ChavesReligadores.index,
      titulo: 'Chaves e Religadores',
    ),
    Selectitem  (
      id: TemaFiscalizacao.ParaRaios.index,
      titulo: 'Para-Raios',
    ),
    Selectitem(
      id: TemaFiscalizacao.IluminacaoPublica.index,
      titulo: 'Iluminação Pública',
    ),
    Selectitem  (
      id: TemaFiscalizacao.Vegetacao.index,
      titulo: 'Vegetação',
    ),
    Selectitem(
      id: TemaFiscalizacao.Seguranca.index,
      titulo: 'Segurança e Sinalização',
    ),
    Selectitem(
      id: TemaFiscalizacao.Outros.index,
      titulo: 'Outros',
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