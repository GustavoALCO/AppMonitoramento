import 'package:flutter/material.dart';

class CardRotaComponent extends StatelessWidget {
  final String nomeRota;
  final String alimentador;
  final String dataInicio;
  final String? dataFinal;
  final VoidCallback? onTap;

  const CardRotaComponent({
    super.key,
    required this.nomeRota,
    required this.alimentador,
    required this.dataInicio,
    this.dataFinal,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// TÍTULO + SETA
              Row(
                children: [
                  Expanded(
                    child: Text(
                      nomeRota,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),

              const SizedBox(height: 12),

              _infoRow(
                icon: Icons.electrical_services,
                label: "Alimentador",
                value: alimentador,
              ),

              const SizedBox(height: 6),

              _infoRow(
                icon: Icons.calendar_today,
                label: "Data Inicial",
                value: dataInicio,
              ),

              if (dataFinal != null && dataFinal!.isNotEmpty) ...[
                const SizedBox(height: 6),
                _infoRow(
                  icon: Icons.event_available,
                  label: "Data Final",
                  value: dataFinal!,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 6),
        Text(
          "$label: ",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
