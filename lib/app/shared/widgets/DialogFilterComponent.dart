import 'package:flutter/material.dart';
import 'package:monitoramento/app/shared/utils/AppColors.dart';
import 'package:monitoramento/app/shared/widgets/InputComponent.dart';
class DialogFilterComponent extends StatefulWidget {
  const DialogFilterComponent({super.key});

  @override
  State<DialogFilterComponent> createState() => _DialogFilterComponentState();
}

class _DialogFilterComponentState extends State<DialogFilterComponent> {

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController dataInicioController = TextEditingController();
  final TextEditingController dataFinalController = TextEditingController();

  @override
  void dispose() {
    nomeController.dispose();
    dataInicioController.dispose();
    dataFinalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// TÍTULO
              const Text(
                "Filtros",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              /// NOME
              const Text(
                "Nome da Rota",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              InputComponent(
                label: "Digite o nome da rota",
                controller: nomeController,
              ),

              const SizedBox(height: 16),

              /// DATA INICIAL
              const Text(
                "Data Inicial",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              InputComponent(
                label: "Selecione a data inicial",
                controller: dataInicioController,
              ),

              const SizedBox(height: 16),

              /// DATA FINAL
              const Text(
                "Data Final",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              InputComponent(
                label: "Selecione a data final",
                controller: dataFinalController,
              ),

              const SizedBox(height: 24),

              /// BOTÕES
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 6,
                      shadowColor: Colors.black,
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      /// Retorna os valores para tela principal
                      Navigator.pop(context, {
                        "nome": nomeController.text,
                        "dataInicio": dataInicioController.text,
                        "dataFinal": dataFinalController.text,
                      });
                    },
                    child: const Text("Aplicar"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
