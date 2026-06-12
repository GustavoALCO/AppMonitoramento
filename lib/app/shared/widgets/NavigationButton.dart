import 'package:flutter/material.dart';
import 'package:monitoramento/app/shared/utils/AppColors.dart';

class NavigationButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onPressed;

  const NavigationButton({
    required this.label,
    required this.selected,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 6,
        backgroundColor: selected ? AppColors.primary : AppColors.secondary,
        foregroundColor: selected ? AppColors.secondary : AppColors.cards,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        minimumSize: const Size(double.infinity, 44),
        side: BorderSide(
          color: Colors.black,
          width: 0.5,
        ),
      ),
      onPressed: onPressed,
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
