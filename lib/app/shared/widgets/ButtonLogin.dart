import 'package:flutter/material.dart';
import 'package:monitoramento/app/shared/utils/AppColors.dart';

class ButtonLogin extends StatelessWidget {
  final VoidCallback onPressed;

  const ButtonLogin({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 6,
        shadowColor: Colors.black,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        minimumSize: const Size(double.infinity, 48), // largura padrão
      ),
      onPressed: onPressed,
      child: const Text(
        'Entrar',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
