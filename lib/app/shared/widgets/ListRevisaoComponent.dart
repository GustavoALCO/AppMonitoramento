import 'package:flutter/material.dart';
import 'package:monitoramento/app/shared/widgets/CardRevisaoComponent.dart';
import 'package:monitoramento/core/features/models/evidencias/evidencias_model.dart';

class ListRevisaoComponent extends StatelessWidget {
  final List<EvidenciaModel> revisoes;
  final Function(int id) onDelete;
  final ScrollController controller;
  final bool isLoadingMore;

  const ListRevisaoComponent({
    super.key,
    required this.revisoes,
    required this.onDelete,
    required this.controller,
    required this.isLoadingMore,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: revisoes.length + 1,
      itemBuilder: (context, index) {
        if (index < revisoes.length) {
          final item = revisoes[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: CardRevisaoComponent(
              evidencia: item,
              count: index + 1,
              onDelete: onDelete,
            ),
          );
        }

        if (isLoadingMore) {
          return const Padding(
            padding: EdgeInsets.all(20),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        return const SizedBox();
      },
    );
  }
}