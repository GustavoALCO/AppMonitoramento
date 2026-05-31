import 'package:flutter/material.dart';
import 'package:monitoramento/app/modules/Pages/Revisao/RevisaoPage.dart';
import 'package:monitoramento/app/shared/enums/enumDocument.dart';
import 'package:monitoramento/app/shared/widgets/CardRotaComponent.dart';
import 'package:monitoramento/core/features/models/rotas/rotas_model.dart';

class ListRotasSelectableComponent extends StatefulWidget {
  final List<RotasModel> rotas;
  final ScrollController controller;
  final bool isLoadingMore;
  final ZipMode mode;
  
  final Function(Set<String>)? onSelectionChanged;

  const ListRotasSelectableComponent({
    super.key,
    required this.rotas,
    required this.controller,
    required this.isLoadingMore,
    this.onSelectionChanged, 
    required this.mode,
  });

  @override
  State<ListRotasSelectableComponent> createState() =>
      _ListRotasSelectableComponentState();
}

class _ListRotasSelectableComponentState
    extends State<ListRotasSelectableComponent> {
  final Set<String> selectedIds = {};

  void toggleSelection(String id) {
  setState(() {
    if (widget.mode == ZipMode.Oficio) {
      /// 🔥 só pode 1 selecionado
      if (selectedIds.contains(id)) {
        selectedIds.clear();
      } else {
        selectedIds
          ..clear()
          ..add(id);
      }
    } else {
      /// normal (multi seleção)
      if (selectedIds.contains(id)) {
        selectedIds.remove(id);
      } else {
        selectedIds.add(id);
      }
    }
  });

  widget.onSelectionChanged?.call(selectedIds);
}

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.controller,
      itemCount: widget.rotas.length + 1,
      itemBuilder: (context, index) {
        if (index < widget.rotas.length) {
          final item = widget.rotas[index];
          final isSelected = selectedIds.contains(item.id);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Stack(
              children: [
                /// CARD
                CardRotaComponent(
                  nomeRota: item.nome,
                  concessionaria: item.conc.name,
                  alimentador: item.alimentador,
                  dataInicio: item.dataInicio,
                  dataFinal: item.dataFinal,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Revisaopage(
                          id: item.id,
                          isfiniched: item.dataFinal != null &&
                              item.dataFinal!.isNotEmpty,
                        ),
                      ),
                    );
                  },
                ),

                /// CHECKBOX
                Positioned(
                  top: 8,
                  right: 8,
                  child: Checkbox(
                    value: isSelected,
                    onChanged: (_) => toggleSelection(item.id),
                  ),
                ),
              ],
            ),
          );
        }

        if (widget.isLoadingMore) {
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