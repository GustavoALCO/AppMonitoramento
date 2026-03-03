import 'package:flutter/material.dart';
import 'package:monitoramento/app/shared/widgets/CardRevisaoComponent.dart';
import 'package:monitoramento/core/features/models/evidencias/evidencias_model.dart';

class ListRevisaoComponent extends StatelessWidget {
  final List<EvidenciaModel> revisoes;
  final Function(int id) onDelete; 

  const ListRevisaoComponent({
    super.key,
    required this.revisoes,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: revisoes.length,
      itemBuilder: (context, index) {
        final item = revisoes[index];

        return Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: CardRevisaoComponent(
            evidencia: item,
            count: index + 1,
            onDelete: onDelete, 
          ),
        );
      },
    );
  }
}