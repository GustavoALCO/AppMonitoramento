import 'package:flutter/material.dart';
import 'package:monitoramento/app/modules/Pages/Revisao/RevisaoPage.dart';
import 'package:monitoramento/app/shared/widgets/CardRotaComponent.dart';
import 'package:monitoramento/core/features/models/rotas/rotas_model.dart';

class ListRotasComponent extends StatelessWidget {
  final List<RotasModel> rotas;
  final ScrollController controller;
  final bool isLoadingMore;

  const ListRotasComponent({
    super.key,
    required this.rotas,
    required this.controller,
    required this.isLoadingMore,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: rotas.length + 1,
      itemBuilder: (context, index) {
        if (index < rotas.length) {
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
                  MaterialPageRoute(
                    builder: (_) => Revisaopage(id: item.id),
                  ),
                );
              },
            ),
          );
        }

        if (isLoadingMore) {
          return const Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}