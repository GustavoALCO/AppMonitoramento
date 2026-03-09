// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:monitoramento/app/modules/Pages/Evidencias/EvidenciasPage.dart';
import 'package:monitoramento/app/shared/enums/enumEvidenciaMode.dart';
import 'package:monitoramento/app/shared/utils/AppColors.dart';
import 'package:monitoramento/core/features/models/evidencias/evidencias_model.dart';
import 'package:monitoramento/core/services/geo_service.dart';

class CardRevisaoComponent extends StatelessWidget {
  final EvidenciaModel evidencia;
  final int count;
  final Function(int id) onDelete;
  final GeoService _geoService = GeoService();

  CardRevisaoComponent({
    super.key,
    required this.evidencia,
    required this.count,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 232, 232, 232),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [BoxShadow(blurRadius: 4, offset: Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// CABEÇALHO
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Data: ${evidencia.horario}",
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 22, 22, 22),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Alimentador: ${evidencia.alimentador ?? "Alimentador não informado"}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          "Fiscal: ",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          evidencia.fiscal,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// BADGE + MENU
              Column(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: Text(
                        "$count",
                        style: const TextStyle(
                          color: AppColors.secondary,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert),
                    onSelected: (value) {
                      switch (value) {
                        case 'edit':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => EvidenciasPage(
                                mode: EvidenciaMode.alterar,
                                model: evidencia,
                                rotaId: evidencia.rotaId,
                              ),
                            ),
                          );
                          break;

                        case 'delete':
                          _confirmarExclusao(context);
                          break;

                        case 'view':
                            _geoService.abrirMapa(evidencia.latitude, evidencia.longitude);
                        break;
                      }
                    },
                    itemBuilder: (context) => const [
                      PopupMenuItem(value: 'edit', child: Text('Editar')),
                      PopupMenuItem(value: 'delete', child: Text('Excluir')),
                      PopupMenuItem(value: 'view', child: Text('Maps')),
                    ],
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// IMAGEM
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                evidencia.imageURL,
                fit: BoxFit.cover,
                // ignore: unnecessary_underscores
                errorBuilder: (_, __, ___) =>
                    const Center(child: Icon(Icons.image_not_supported)),
              ),
            ),
          ),

          const SizedBox(height: 12),

          /// TEMA
          Center(
            child: Text(
              evidencia.temaFiscalizacao.name.toString(),
              style: const TextStyle(
                  fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 12),

          /// ENDEREÇO
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Endereço: ",
                style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Text(
                  evidencia.endereco,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// IDENTIFICADOR
          Row(
            children: [
              const Text(
                "Identificador: ",
                style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Text(
                  evidencia.identificacao ??
                      "Sem Identificação no Poste",
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// DESCRIÇÃO
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Descrição: ",
                style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Text(
                  evidencia.descricao?.isNotEmpty == true
                      ? evidencia.descricao!
                      : "Sem descrição informada.",
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _confirmarExclusao(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Confirmar exclusão"),
        content:
            const Text("Deseja realmente excluir esta evidência?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Cancelar",
              style: TextStyle(color: AppColors.secondary),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onDelete(evidencia.evidenciaRotaId);
            },
            child: const Text(
              "Excluir",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}