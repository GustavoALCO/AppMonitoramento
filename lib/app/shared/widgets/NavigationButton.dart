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
        elevation: selected ? 6 : 6,
        backgroundColor:
            selected ? AppColors.primary : Colors.grey.shade300,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        minimumSize: const Size(double.infinity, 44),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
