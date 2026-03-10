import 'package:flutter/material.dart';
import 'package:monitoramento/app/shared/utils/AppColors.dart';

class InputComponent extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController? controller;

  const InputComponent({
    required this.label,
    this.obscureText = false,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: AppColors.secondary,
          fontWeight: FontWeight.w500,
        ),

        filled: true, // ativa o background
        fillColor: AppColors.cards, // cor de fundo

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.cards),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.secondary, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
      ),
    );
  }
}
