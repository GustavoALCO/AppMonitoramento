import 'package:flutter/material.dart';
import 'package:monitoramento/app/modules/Pages/Revisao/RevisaoPage.dart';
import 'package:monitoramento/app/shared/widgets/CardRotaComponent.dart';
import 'package:monitoramento/core/features/models/rotas/rotas_model.dart';

class ListRotasComponent extends StatelessWidget {
  final List<RotasModel> rotas;

  const ListRotasComponent({super.key, required this.rotas});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rotas.length,
      itemBuilder: (context, index) {
        final item = rotas[index];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: CardRotaComponent(
            nomeRota: item.nome,
            alimentador: item.alimentador,
            dataInicio: item.dataInicio,
            dataFinal: item.dataFinal,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Revisaopage(id: item.id)),
              );
            },
          ),
        );
      },
    );
  }
}
