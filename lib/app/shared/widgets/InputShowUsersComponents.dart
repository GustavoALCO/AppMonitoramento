import 'package:flutter/material.dart';
import 'package:monitoramento/app/shared/utils/AppColors.dart';

class Item {
  final int id;
  final String nome;

  Item({required this.id, required this.nome});
}

class Inputshowuserscomponents extends StatefulWidget {
  final List<Item> itens;
  final Function(List<int>) onChanged;
  final String label;

  const Inputshowuserscomponents({
    super.key,
    required this.itens,
    required this.onChanged,
    this.label = "Selecionar usuários",
  });

  @override
  State<Inputshowuserscomponents> createState() =>
      _InputshowuserscomponentsState();
}

class _InputshowuserscomponentsState
    extends State<Inputshowuserscomponents> {

  // ignore: prefer_final_fields
  List<int> _selecionados = [];

  void _abrirSelect() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.cards,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  // 🔹 Título
                  Text(
                    widget.label,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 🔹 Lista
                  SizedBox(
                    height: 300,
                    child: ListView(
                      children: widget.itens.map((item) {
                        final isSelected =
                            _selecionados.contains(item.id);

                        return CheckboxListTile(
                          value: isSelected,

                          title: Text(
                            item.nome,
                            style: TextStyle(
                              color: AppColors.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          activeColor: AppColors.secondary,
                          checkColor: Colors.white,

                          side: BorderSide(
                            color: AppColors.secondary,
                            width: 1.5,
                          ),

                          controlAffinity:
                              ListTileControlAffinity.leading,

                          onChanged: (value) {
                            setModalState(() {
                              if (value == true) {
                                _selecionados.add(item.id);
                              } else {
                                _selecionados.remove(item.id);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 🔹 Botão confirmar
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                      ),
                      onPressed: () {
                        Navigator.pop(context);

                        setState(() {});
                        widget.onChanged(_selecionados);
                      },
                      child: const Text("Confirmar"),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // 🔹 Label igual InputComponent
        Text(
          widget.label,
          style: TextStyle(
            color: AppColors.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),

        // 🔹 Campo
        GestureDetector(
          onTap: _abrirSelect,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: AppColors.cards,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.cards),
            ),
            child: Text(
              _selecionados.isEmpty
                  ? "Selecionar"
                  : "${_selecionados.length} selecionado(s)",
              style: TextStyle(
                color: AppColors.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}