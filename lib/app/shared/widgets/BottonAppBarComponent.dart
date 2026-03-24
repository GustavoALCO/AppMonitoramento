import 'package:flutter/material.dart';
import 'package:monitoramento/app/modules/Pages/Evidencias/EvidenciasPage.dart';
import 'package:monitoramento/app/shared/enums/enumEvidenciaMode.dart';
import 'package:monitoramento/app/shared/utils/AppColors.dart';

class Bottomappbarcomponent extends StatelessWidget {
  const Bottomappbarcomponent({
    super.key,
    required this.rota,
    required this.rotaid,
  });
  final int rotaid;
  final String rota;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 8,
      color: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              /// BOTÃO ADICIONAR
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EvidenciasPage(
                          mode: EvidenciaMode.criar,
                          rotaId: rotaid,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Adicionar"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: BorderSide(color: Colors.grey.shade400),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              /// BOTÃO ENVIAR
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, rota);
                  },
                  icon: const Icon(Icons.check_circle),
                  label: const Text(
                    "Enviar",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 6,
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
