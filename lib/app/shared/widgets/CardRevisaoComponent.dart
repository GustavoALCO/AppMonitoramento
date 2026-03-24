// ignore_for_file: use_build_context_synchronously, unnecessary_underscores

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:monitoramento/app/modules/Pages/Evidencias/EvidenciasPage.dart';
import 'package:monitoramento/app/shared/dto/evidenciaDto.dart';
import 'package:monitoramento/app/shared/enums/enumEvidenciaMode.dart';
import 'package:monitoramento/app/shared/enums/enumStatusMode.dart';
import 'package:monitoramento/app/shared/utils/AppColors.dart';
import 'package:monitoramento/core/services/geo_service.dart';

class CardRevisaoComponent extends StatelessWidget {
  final EvidenciaCardDto evidencia;
  final int count;
  final Function(String id) onDelete;

  final GeoService _geoService = GeoService();

  CardRevisaoComponent({
    super.key,
    required this.evidencia,
    required this.count,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> imagens;

    if (evidencia.status.index == StatusMode.local.index) {
      imagens = List.from(evidencia.originalImage as Iterable<dynamic>);
    } else {
      //Se
      imagens = evidencia.mediumImage!;
    }

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
          _buildHeader(context),

          const SizedBox(height: 12),

          /// IMAGENS
          if (imagens.isNotEmpty) _buildImages(imagens),

          const SizedBox(height: 12),

          /// TEMA
          Center(
            child: Text(
              evidencia.tema.name,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 12),

          /// ENDEREÇO
          if (evidencia.endereco.isNotEmpty)
            _buildInfo("Endereço:", evidencia.endereco),

          /// IDENTIFICADOR
          if (evidencia.identificacao != null &&
              evidencia.identificacao!.isNotEmpty)
            _buildInfo("Identificador:", evidencia.identificacao!),

          /// DESCRIÇÃO
          if (evidencia.descricao != null && evidencia.descricao!.isNotEmpty)
            _buildInfo("Descrição:", evidencia.descricao!),
        ],
      ),
    );
  }

  /// HEADER
  Widget _buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Data: ${evidencia.horario}",
                style: const TextStyle(fontSize: 13),
              ),

              if (evidencia.alimentador != null)
                Text(
                  "Alimentador: ${evidencia.alimentador}",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              if (evidencia.fiscal.isNotEmpty)
                Text(
                  "Fiscal: ${evidencia.fiscal}",
                  style: const TextStyle(fontSize: 13),
                ),
            ],
          ),
        ),

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
                    _geoService.openMap(
                      evidencia.latitude,
                      evidencia.longitude,
                    );
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
    );
  }

  /// IMAGENS
  Widget _buildImages(List<String> imagens) {
    return Column(
      children: imagens.map((img) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: evidencia.status == StatusMode.local
                  ? Image.file(
                      File(img),
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          const Center(child: Icon(Icons.image_not_supported)),
                    )
                  : Image.network(
                      img,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          const Center(child: Icon(Icons.image_not_supported)),
                    ),
            ),
          ),
        );
      }).toList(),
    );
  }

  /// LINHA DE INFORMAÇÃO
  Widget _buildInfo(String titulo, String valor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Expanded(child: Text(valor, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }

  /// CONFIRMAR EXCLUSÃO
  void _confirmarExclusao(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Confirmar exclusão"),
        content: const Text("Deseja realmente excluir esta evidência?"),
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
              onDelete(evidencia.idEvi);
            },
            child: const Text("Excluir", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
