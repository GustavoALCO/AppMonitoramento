import 'package:flutter/material.dart';
import 'package:monitoramento/app/shared/utils/AppColors.dart';

class Carddocument extends StatelessWidget {
  final IconData icon;
  final String? label;
  final VoidCallback? onTap;
  final bool selected;

  const Carddocument({
    super.key,
    required this.icon,
    this.label,
    this.onTap,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: selected ? 6 : 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: 150,
          height: 150,
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 58,
                  color: selected ? AppColors.primary : Colors.grey,
                ),
                const SizedBox(height: 12),
                Text(label ?? "Card Document"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}